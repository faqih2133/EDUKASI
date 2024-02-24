import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sipo/bottom.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _placeOfBirthController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  String? _gender;

void _submitProfile() async {
  try {
    await FirebaseFirestore.instance.collection('Profile').add({
      'name': _nameController.text,
      'placeOfBirth': _placeOfBirthController.text,
      'dateOfBirth': _dateOfBirthController.text,
      'gender': _gender,
    });
    print('Profile submitted successfully');
    
    // Setelah berhasil mengirim profil, navigasikan ke halaman ProfileData
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileData(
        name: _nameController.text,
        placeOfBirth: _placeOfBirthController.text,
        dateOfBirth: _dateOfBirthController.text,
        gender: _gender,
      )),
    );
  } catch (e) {
    print('Error submitting profile: $e');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey, // Warna latar belakang
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white, // Warna ikon
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _placeOfBirthController,
                decoration: InputDecoration(labelText: 'Place of Birth'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _dateOfBirthController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
                items: ['Male', 'Female']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                decoration: InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitProfile,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
        bottomNavigationBar: BottomNavBar(), // Add BottomNavBar here
    );
  }
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: ProfileData(
      name: 'John Doe',
      placeOfBirth: 'New York',
      dateOfBirth: 'January 1, 1990',
      gender: 'Male',
    ),
  ));
}
class ProfileData extends StatelessWidget {
  final String name;
  final String placeOfBirth;
  final String dateOfBirth;
  final String? gender;

  ProfileData({
    required this.name,
    required this.placeOfBirth,
    required this.dateOfBirth,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Place of Birth: $placeOfBirth',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Date of Birth: $dateOfBirth',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Gender: ${gender ?? 'Not specified'}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
