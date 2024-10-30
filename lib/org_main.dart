// lib/organization/org_main.dart

import 'package:flutter/material.dart';
import 'org_list.dart'; // Import OrgListPage
import 'org_update.dart'; // Import OrgUpdatePage
import 'org_profile.dart'; // Import OrgProfilePage

class OrgMainPage extends StatefulWidget {
  @override
  _OrgMainPageState createState() => _OrgMainPageState();
}

class _OrgMainPageState extends State<OrgMainPage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    OrgListPage(), // Update List
    OrgUpdatePage(), // Update Post
    OrgProfilePage(), // Profile Page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list,
                color: _selectedIndex == 0 ? Colors.deepPurple : Colors.grey),
            label: 'Update List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update,
                color: _selectedIndex == 1 ? Colors.deepPurple : Colors.grey),
            label: 'Update Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: _selectedIndex == 2 ? Colors.deepPurple : Colors.grey),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
