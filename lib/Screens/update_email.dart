import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ksh/Screens/HOME/home.dart';

class update_email extends StatefulWidget {
  @override
  State<update_email> createState() => BMIState();
}

class BMIState extends State<update_email> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController newEmailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    // Add additional email validation logic if needed
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    // Add additional password validation logic if needed
    return null;
  }

  void updateEmailAndPassword() async {
    if (_formKey.currentState!.validate()) {
      String newEmail = newEmailController.text;
      String newPassword = newPasswordController.text;

      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        try {
          // Update email
          if (newEmail.isNotEmpty) {
            await user.updateEmail(newEmail);
          }

          // Update password
          if (newPassword.isNotEmpty) {
            await user.updatePassword(newPassword);
          }

          // Show success message or navigate to another screen
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Update Success'),
                content: Text('Email and password updated successfully.'),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => home(),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          );
        } catch (error) {
          // Show error message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Update Failed'),
                content: Text(error.toString()),
                actions: <Widget>[
                  TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 50.0),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/gfr.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              color: Color(0xff205072),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              height: 300,
                              child: Image.asset(
                                'assets/images/Icons.png',
                                width: 120,
                                height: 100,
                              ),
                            ),
                          ],
                        ),

                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: newEmailController,
                                decoration: InputDecoration(
                                  labelText: 'New Email',
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                validator: validateEmail,
                              ),
                              SizedBox(height: 10),
                              TextFormField(
                                controller: newPasswordController,
                                decoration: InputDecoration(
                                  labelText: 'New Password',
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                obscureText: true,
                                validator: validatePassword,
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: 200,
                                child: ElevatedButton(
                                  onPressed: updateEmailAndPassword,
                                  child: Text(
                                    'Save',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(15),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
