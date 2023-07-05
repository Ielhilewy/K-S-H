import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ksh/Customs/Customtf.dart';
import 'package:ksh/Customs/custom_button.dart';

import '../LOGIN/login.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 300, sigmaY: 500.0),
              child: Image.asset(
                'assets/images/signup.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 80,
                        height: 100,
                        child: Image.asset(
                          'assets/images/Icons.png',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 208,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTf(
                        controller: nameController,
                        labelText: 'Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTf(
                        controller: emailController,
                        labelText: 'Email',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CustomTf(
                        controller: passwordController,
                        labelText: 'Password',
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Already have an account?'),
                    TextButton(
                      child: const Text(
                        'Log In',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment:  MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 240,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String name = nameController.text;
                              String email = emailController.text;
                              String password = passwordController.text;

                              // Perform the sign-up operation
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(email: email, password: password)
                                  .then((userCredential) {
                                // Sign-up success
                                User? user = userCredential.user;
                                if (user != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                  // Do something with the user (e.g., store additional data)
                                  // Show a success message or navigate to another screen
                                }
                              }).catchError((error) {
                                // Sign-up failed
                                String errorMessage = error.toString();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Sign Up Failed'),
                                      content: Text(errorMessage),
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
                              });
                            }
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
