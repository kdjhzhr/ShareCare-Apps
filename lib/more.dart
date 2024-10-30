import 'package:flutter/material.dart';
import 'login.dart'; // Import the LoginPage

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 20, 25, 178),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text('Sarah'),
                  subtitle: Text('sarah@email.com'),
                  trailing: Icon(Icons.edit),
                  onTap: () {
                    // Navigate to profile edit page
                  },
                ),
              ),
              SizedBox(height: 20),

              // Account Section
              Text(
                'Account',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.history,
                          color: const Color.fromARGB(255, 28, 35, 140)),
                      title: Text('Order History'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to order history
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.location_on,
                          color: const Color.fromRGBO(73, 35, 179, 1)),
                      title: Text('Donation Addresses'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to addresses
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.payment,
                          color: const Color.fromARGB(255, 37, 1, 179)),
                      title: Text('Payment Methods'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        // Navigate to payment methods
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Logout Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    // Show a confirmation dialog when the user clicks the logout button
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Logout'),
                          content: Text('Are you sure you want to logout?'),
                          actions: [
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Logout'),
                              onPressed: () {
                                // Navigate back to the LoginPage after logout
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
