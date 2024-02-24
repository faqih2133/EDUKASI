import 'package:flutter/material.dart';
import 'package:sipo/hal1.dart';
import 'package:sipo/main.dart';
import 'package:sipo/profile.dart';
import 'package:sipo/vidio.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
   TextEditingController _nameController = TextEditingController();
  TextEditingController _placeOfBirthController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  String? _gender;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.dashboard),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NextScreen(
                    name: _nameController.text,
        placeOfBirth: _placeOfBirthController.text,
        dateOfBirth: _dateOfBirthController.text,
        gender: _gender ?? '',
                )),
              );
            },
            color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomDateWidget()),
              );
            },
            color: _selectedIndex == 1 ? Colors.blue : Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.book),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.video_library),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoScreen()),
              );
            },
            color: _selectedIndex == 3 ? Colors.blue : Colors.grey,
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            color: _selectedIndex == 4 ? Colors.blue : Colors.grey,
          ),
        ],
      ),
    );
  }
}
