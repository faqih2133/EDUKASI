import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BantuanScreen extends StatefulWidget {
  @override
  _BantuanScreenState createState() => _BantuanScreenState();
}

class _BantuanScreenState extends State<BantuanScreen> {
  final String countryCode = '+62';
  final String whatsappNumber = '85817926287';
  final String message = 'Halo, saya membutuhkan bantuan.';

  void _hubungiAdmin() async {
    final url =
        "whatsapp://send?phone=$countryCode$whatsappNumber&text=${Uri.encodeComponent(message)}";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print(
          'Tidak dapat membuka WhatsApp. Pastikan WhatsApp terinstal di perangkat Anda.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bantuan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hubungiAdmin,
              child: Text(
                'Hubungi Admin via WhatsApp',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
