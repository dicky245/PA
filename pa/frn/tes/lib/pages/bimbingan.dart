import 'package:flutter/material.dart';
import 'package:tes/pages/request_bimbingan.dart';

void main() {
  runApp(const Bimbingan());
}

class Bimbingan extends StatelessWidget {
  const Bimbingan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BimbinganScreen(),
    );
  }
}

class BimbinganScreen extends StatelessWidget {
  const BimbinganScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vokasi Tera"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Bimbingan",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => RequestBimbinganPage()));
              },
              child: const Text(
                "Request Bimbingan",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Showing of 6 items"),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text("No")),
                    DataColumn(label: Text("Keperluan")),
                    DataColumn(label: Text("Tanggal")),
                    DataColumn(label: Text("Status")),
                  ],
                  rows: const [
                    DataRow(cells: [
                      DataCell(Text("1")),
                      DataCell(Text("Pengajuan Topik")),
                      DataCell(Text("10-09-2025 14:30 WIB")),
                      DataCell(Text("Selesai")),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("2")),
                      DataCell(Text("Finalisasi Topik")),
                      DataCell(Text("10-09-2025 14:30 WIB")),
                      DataCell(Text("Menunggu")),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("3")),
                      DataCell(Text("Diskusi Vendor")),
                      DataCell(Text("10-09-2025 14:30 WIB")),
                      DataCell(Text("Dibatalkan")),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("4")),
                      DataCell(Text("Diskusi PRS")),
                      DataCell(Text("10-09-2025 14:30 WIB")),
                      DataCell(Text("Menunggu")),
                    ]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Pedoman Bimbingan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "1. Request Bimbingan Melalui VokasiTera\n"
              "2. Tunggu Hingga Dosen Menyetujui\n"
              "3. Setelah disetujui, hadir 10 hingga 15 menit sebelum pertemuan dilakukan",
            ),
          ],
        ),
      ),
    );
  }
}
