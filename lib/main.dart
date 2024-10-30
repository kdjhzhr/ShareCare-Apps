import 'package:flutter/material.dart';
import 'shopping.dart';
import 'update.dart';
import 'donate.dart';
import 'more.dart';
import 'login.dart'; // Import the LoginPage

void main() {
  runApp(ShoppingListApp());
}

class ShoppingListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Bank App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginPage(), // Set the LoginPage as the home
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    ShoppingListPage(),
    UpdatesPage(),
    DonatePage(),
    MorePage(),
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
            icon: Icon(Icons.shopping_cart,
                color: _selectedIndex == 0 ? Colors.deepPurple : Colors.grey),
            label: 'Shopping List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update,
                color: _selectedIndex == 1 ? Colors.deepPurple : Colors.grey),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money,
                color: _selectedIndex == 2 ? Colors.deepPurple : Colors.grey),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz,
                color: _selectedIndex == 3 ? Colors.deepPurple : Colors.grey),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
