import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  Map<String, double> emailMap = {}; // Map to store unique emails and dangerous values

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 300, sigmaY: 500.0),
              child: Image.asset(
                'assets/images/booking.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 220,
                    height: 170,
                    child: Image.asset(
                      'assets/images/Icons.png',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                color: Colors.white54,
                width: 600,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Note:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "If you find yourself among the first 50, then you have a place in the hospital,",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "and we are waiting for your visit tomorrow to confirm the reservation.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "In the event that the reservation is not confirmed, you will have to register again.",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .orderBy('dangerous')
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }
                    // Extract the sorted data
                    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
                        snapshot.data!.docs;
                    // Reset the email map
                    emailMap.clear();
                    // Update the email map with unique emails and their dangerous values
                    for (var document in documents) {
                      String email = document.data()['email'];
                      double dangerous = document.data()['dangerous'] as double; // Convert to double
                      emailMap[email] = dangerous;
                    }
                    // Sort the email map by value in ascending order
                    List<MapEntry<String, double>> sortedEmails = emailMap.entries.toList();
                    sortedEmails.sort((a, b) => a.value.compareTo(b.value));
                    // TODO: Display the data in your UI widgets
                    return ListView.builder(
                      itemCount: sortedEmails.length,
                      itemBuilder: (context, index) {
                        // Get the email and dangerous value at the specified index
                        String email = sortedEmails[index].key;
                        double dangerous = sortedEmails[index].value;
                        // TODO: Display the data in your UI widgets
                        return ListTile(
                          leading: Text(
                            '${index + 1}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ), // Display the index number with bold font
                          title: Text(
                            email,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            'Dangerous: $dangerous',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
