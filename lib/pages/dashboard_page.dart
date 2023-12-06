import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data untuk diagram pie total kartu kuning 2023
    Map<String, double> totalKKData = {
      'Januari': 14,
      'Februari': 12,
      'Maret': 10,
    };

    // Data untuk diagram pie total kartu kuning posisi 2023
    Map<String, double> posisiKKData = {
      'Cleaning Service': 15,
      'Banquet': 10,
      'Security': 12,
    };

    // Data untuk diagram pie total kartu kuning pegawai 2023
    Map<String, double> pegawaiKKData = {
      'Muhammad Fahmi F': 10,
      'Muhammad Rifki F': 15,
      'Muhammad Haekal': 18,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildPieChart(context, 'Grafik Total Kartu Kuning 2023',
                  totalKKData, 'Grafik Total Kartu Kuning'),
              const SizedBox(height: 16.0),
              _buildPieChart(context, 'Grafik Total Kartu Kuning Posisi 2023',
                  posisiKKData, 'Grafik Total Kartu Kuning Posisi'),
              const SizedBox(height: 16.0),
              _buildPieChart(context, 'Grafik Total Kartu Kuning Pegawai 2023',
                  pegawaiKKData, 'Grafik Total Kartu Kuning Pegawai'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPieChart(BuildContext context, String title,
      Map<String, double> data, String boxTitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8.0),
        Card(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  boxTitle,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () {
                    _showPopup(context, data);
                  },
                  child: PieChart(
                    dataMap: data,
                    chartRadius: MediaQuery.of(context).size.width / 3.2,
                    chartType: ChartType.ring,
                    centerText: 'Kartu Kuning',
                    legendOptions: const LegendOptions(
                      showLegendsInRow: true,
                      legendPosition: LegendPosition.bottom,
                      showLegends: true,
                      legendTextStyle: TextStyle(fontSize: 12),
                    ),
                    chartValuesOptions: ChartValuesOptions(
                      showChartValues: true,
                      showChartValuesInPercentage: false, // Ubah ke false
                      showChartValuesOutside: false,
                      chartValueBackgroundColor: Colors.transparent,
                      chartValueStyle: TextStyle(
                        color: Colors.blueGrey[900],
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showPopup(BuildContext context, Map<String, double> data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Detail'),
          content: SingleChildScrollView(
            child: Column(
              children: data.entries.map((entry) {
                return ListTile(
                  title: Text(entry.key),
                  subtitle: Text('Kartu Kuning: ${entry.value}'),
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void main() {
    runApp(
      const MaterialApp(
        home: DashboardPage(),
      ),
    );
  }
}
