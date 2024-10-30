// lib/organization/org_profile.dart

import 'package:flutter/material.dart';
import 'login.dart'; // Import the LoginPage

class OrgProfilePage extends StatefulWidget {
  const OrgProfilePage({Key? key}) : super(key: key);

  @override
  _OrgProfilePageState createState() => _OrgProfilePageState();
}

class _OrgProfilePageState extends State<OrgProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String _organizationName = 'Your Organization Name';
  String _contactEmail = 'your.email@example.com';
  String _phoneNumber = '123-456-7890';
  bool _isEditing = false; // Track whether the form is in edit mode

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Save the profile information
      // For now, just print the updated information
      print('Organization Name: $_organizationName');
      print('Contact Email: $_contactEmail');
      print('Phone Number: $_phoneNumber');

      // Optionally, show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully!')),
      );

      // Exit edit mode
      setState(() {
        _isEditing = false;
      });
    }
  }

  void _logout() {
    // Navigate back to the LoginPage after logout
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Profile Information',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              if (_isEditing) ...[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Organization Name',
                    border: OutlineInputBorder(),
                  ),
                  initialValue: _organizationName,
                  onChanged: (value) {
                    setState(() {
                      _organizationName = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your organization name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contact Email',
                    border: OutlineInputBorder(),
                  ),
                  initialValue: _contactEmail,
                  onChanged: (value) {
                    setState(() {
                      _contactEmail = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(),
                  ),
                  initialValue: _phoneNumber,
                  onChanged: (value) {
                    setState(() {
                      _phoneNumber = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveProfile,
                  child: Text('Save Profile'),
                ),
              ] else ...[
                ListTile(
                  title: Text('Organization Name:'),
                  subtitle: Text(_organizationName),
                ),
                ListTile(
                  title: Text('Contact Email:'),
                  subtitle: Text(_contactEmail),
                ),
                ListTile(
                  title: Text('Phone Number:'),
                  subtitle: Text(_phoneNumber),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isEditing = true; // Switch to edit mode
                    });
                  },
                  child: Text('Edit Profile'),
                ),
              ],
              SizedBox(height: 20), // Add some space before the logout button
              TextButton(
                child: Text('Logout'),
                onPressed: _logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
