import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ksh/Screens/HOME/home.dart';
import 'package:ksh/Screens/SIGN_UP/signup.dart';
import '../../Customs/Custom_textfield.dart';
import '../../Customs/custom_button.dart';
import 'forget passward.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 300, sigmaY: 500.0),
              child: Image.asset(
                'assets/images/login.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kidney Specialist Hospital",
                        style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 100,
                          height: 200,
                          child: Image.asset(
                            'assets/images/Icons.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomTextField(
                    controller: nameController,
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    obscureText: !_passwordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                      );
                    },
                    child: const Text('Forgot Password'),
                  ),

                  const SizedBox(height: 10),
                  CustomButton(
                    text: 'Login',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        String email = nameController.text;
                        String password = passwordController.text;
                        // Perform login operation
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        )
                            .then((userCredential) {
                          // Login success
                          User? user = userCredential.user;
                          if (user != null) {
                            // Do something with the user (e.g., store user data)
                            // Navigate to home screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => home(),
                              ),
                            );
                          }
                        }).catchError((error) {
                          // Login failed
                          String errorMessage = error.toString();
                          // Show an error message or handle the error
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Login Failed'),
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
                  ),
                  Row(
                    children: <Widget>[
                      const Text('Does not have an account?'),
                      TextButton(
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => signup(),
                            ),
                          );
                        },
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
