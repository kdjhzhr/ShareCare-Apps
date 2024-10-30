// lib/organization/org_list.dart

import 'package:flutter/material.dart';

class OrgListPage extends StatelessWidget {
  const OrgListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Update Item Status',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Example of a dropdown to select item status
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Item Status',
                border: OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(
                    value: 'Urgently Needed', child: Text('Urgently Needed')),
                DropdownMenuItem(
                    value: 'Low in Stock', child: Text('Low in Stock')),
                DropdownMenuItem(
                    value: 'Well Stocked', child: Text('Well Stocked')),
              ],
              onChanged: (value) {
                // Handle status change
              },
              validator: (value) =>
                  value == null ? 'Please select a status' : null,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle update action
              },
              child: Text('Update Status'),
            ),
          ],
        ),
      ),
    );
  }
}
