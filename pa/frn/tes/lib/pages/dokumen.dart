import 'package:flutter/material.dart';

void main() {
  runApp(UploadDocumentApp());
}

class UploadDocumentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UploadDocumentPage(),
    );
  }
}

class UploadDocumentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengumpulan Dokumen'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCard("📄 Format & Penamaan File", [
              "• Format: PDF atau JPG",
              "• Penamaan: KartuBimbingan_PAII_01.pdf"
            ]),
            _buildCard("📌 Submission Status", [
              "✅ Status: No attempt",
              "📊 Grading Status: Not graded",
              "📅 Due: 23 Feb 2025, 11:00 PM",
              "⏳ Remaining: 3 days 7 hours"
            ]),
            _buildCard("⚡ Action", ["Klik tombol di bawah untuk menambahkan file."]),
            SizedBox(height: 20),
            Center(
              child: AnimatedButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String title, List<String> contents) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            Divider(thickness: 1, color: Colors.blueAccent.withOpacity(0.5)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: contents
                  .map((text) => Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 14),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UploadPage()),
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: _isPressed ? Colors.blue[700] : Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
          boxShadow: _isPressed
              ? []
              : [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.5),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.cloud_upload, color: Colors.white),
            SizedBox(width: 8),
            Text(
              "Add Submission",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Upload Dokumen
class UploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Dokumen"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.file_upload, size: 80, color: Colors.blueAccent),
            SizedBox(height: 20),
            Text(
              "Pilih dokumen untuk diunggah",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Tambahkan fungsi upload di sini
                Navigator.push(context, 
                MaterialPageRoute(builder: (context) =>  UploadDocumentApp() ));
              },
              icon: Icon(Icons.attach_file),
              label: Text("Pilih File"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
