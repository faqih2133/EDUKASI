import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Graphic extends StatefulWidget {
  @override
  _GraphicState createState() => _GraphicState();
}

class _GraphicState extends State<Graphic> {
  // Mendapatkan referensi ke Firebase Storage
  final Reference _storage = FirebaseStorage.instance.ref().child('assets/book.jpg'); // Ganti dengan path gambar Anda

  // Variabel untuk menyimpan URL gambar
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    // Memuat URL gambar dari Firebase Storage saat widget pertama kali diinisialisasi
    _loadImage();
  }

  // Metode untuk memuat URL gambar dari Firebase Storage
  Future<void> _loadImage() async {
    try {
      final String imageUrl = await _storage.getDownloadURL();
      setState(() {
        _imageUrl = imageUrl;
      });
    } catch (e) {
      print('Error loading image: $e');
      // Handle error loading image
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graphic'),
      ),
      body: Center(
        child: _imageUrl != null
            ? Image.network(
                _imageUrl!,
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              )
            : CircularProgressIndicator(), // Tampilkan indikator loading jika gambar belum dimuat
      ),
    );
  }
}
