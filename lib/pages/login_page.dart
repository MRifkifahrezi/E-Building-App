// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs, avoid_print, unused_import, use_key_in_widget_constructors, use_build_context_synchronously

import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'dart:convert';
import 'package:building_app/values/app_routes.dart';
import '../components/app_text_form_field.dart';
import '../utils/extensions.dart';
import '../values/app_colors.dart';
import '../values/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) {
      return;
    }

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason: 'Let OS determine authentication method',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    setState(
        () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Error - ${e.message}';
      });
      return;
    }
    if (!mounted) {
      return;
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  Future<void> _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 30),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (_supportState == _SupportState.unknown)
                  const CircularProgressIndicator()
                else if (_supportState == _SupportState.supported)
                  const Text('This device is supported')
                else
                  const Text('This device is not supported'),
                const Divider(height: 100),
                Text('Can check biometrics: $_canCheckBiometrics\n'),
                ElevatedButton(
                  onPressed: _checkBiometrics,
                  child: const Text('Check biometrics'),
                ),
                const Divider(height: 100),
                Text('Available biometrics: $_availableBiometrics\n'),
                ElevatedButton(
                  onPressed: _getAvailableBiometrics,
                  child: const Text('Get available biometrics'),
                ),
                const Divider(height: 100),
                Text('Current State: $_authorized\n'),
                if (_isAuthenticating)
                  ElevatedButton(
                    onPressed: _cancelAuthentication,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Cancel Authentication'),
                        Icon(Icons.cancel),
                      ],
                    ),
                  )
                else
                  Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: _authenticate,
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text('Authenticate'),
                            Icon(Icons.perm_device_information),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _authenticateWithBiometrics,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(_isAuthenticating
                                ? 'Cancel'
                                : 'Authenticate: biometrics only'),
                            const Icon(Icons.fingerprint),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isObscure = true;

  Future<void> _authenticateBiometric() async {
    final localAuth = LocalAuthentication();

    try {
      bool canCheckBiometrics = await localAuth.canCheckBiometrics;
      List<BiometricType> availableBiometrics =
          await localAuth.getAvailableBiometrics();

      if (canCheckBiometrics && availableBiometrics.isNotEmpty) {
        bool isAuthenticated = await localAuth.authenticate(
          localizedReason: 'Authenticate to access the app',
        );

        if (isAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Biometric authentication successful!'),
            ),
          );
          // Add navigation or appropriate action after successful authentication
          emailController.clear();
          passwordController.clear();
          Navigator.pushNamed(context, AppRoutes.welcomeScreen);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Biometric authentication failed or canceled.'),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Biometric authentication not available.'),
          ),
        );
      }
    } on PlatformException catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: Image.asset(
                    'assets/onboarding/logo-ebuilding.png',
                    height: 150,
                    width: 500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'WELCOME TO \nMOBILE E-BUILDING',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Sign in to your Account',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.black,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppTextFormField(
                          labelText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                          },
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Please, Enter Email Address'
                                : AppConstants.emailRegex.hasMatch(value)
                                    ? null
                                    : 'Invalid Email Address';
                          },
                          controller: emailController,
                          hintText: '',
                        ),
                        AppTextFormField(
                          labelText: 'Password',
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                          },
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Please, Enter Password'
                                : AppConstants.passwordRegex.hasMatch(value)
                                    ? null
                                    : 'Invalid Password';
                          },
                          controller: passwordController,
                          obscureText: isObscure,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all(
                                  const Size(48, 48),
                                ),
                              ),
                              icon: Icon(
                                isObscure
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          hintText: '',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        FilledButton(
                          onPressed: _formKey.currentState?.validate() ?? false
                              ? () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Logged In!'),
                                    ),
                                  );
                                  emailController.clear();
                                  passwordController.clear();
                                  Navigator.pushNamed(
                                      context, AppRoutes.welcomeScreen);
                                }
                              : null,
                          style: const ButtonStyle().copyWith(
                            backgroundColor: MaterialStateProperty.all(
                              _formKey.currentState?.validate() ?? false
                                  ? null
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: const Text('Login'),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                'Or login with',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Colors.black),
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                onPressed: () {
                                  _authenticateBiometric();
                                },
                                icon: const Icon(
                                  Icons.fingerprint,
                                  color: Colors.black,
                                  size: 36,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                onPressed: () {
                                  _authenticateBiometric();
                                },
                                icon: const Icon(
                                  Icons.face,
                                  color: Colors.black,
                                  size: 36,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
