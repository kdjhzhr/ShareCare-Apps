import 'package:flutter/material.dart';

class Update {
  final String title;
  final String description;
  final String date;

  Update({required this.title, required this.description, required this.date});
}

class UpdatesPage extends StatelessWidget {
  final List<Update> updates = [
    Update(
      title: 'New Food Items Available',
      description:
          'We have added new food items to our inventory. Check them out!',
      date: '2024-10-25',
    ),
    Update(
      title: 'Donation Drive Success',
      description: 'Thank you for your generous donations! We raised RM5000.',
      date: '2024-10-20',
    ),
    Update(
      title: 'Volunteer Opportunities',
      description: 'Join us this weekend for our community outreach program.',
      date: '2024-10-15',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Updates'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: updates.length,
          itemBuilder: (context, index) {
            final update = updates[index];
            return Card(
              margin: EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      update.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      update.description,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      update.date,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
