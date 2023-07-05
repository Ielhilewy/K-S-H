import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ksh/Screens/ADVICE/Advice.dart';
import 'package:ksh/Screens/BMI/BMI.dart';
import 'package:ksh/Screens/ABOUT/about.dart';
import 'package:ksh/Screens/CHECK_UP/checkup.dart';
import 'package:ksh/Screens/GFR/gfr.dart';
import 'package:ksh/Screens/LOGIN/login.dart';

import '../update_email.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  bool _isButtonClicked = false;

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Disable back button functionality
        return false;
      },
    child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white10,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/Icons.png',
                      width: 120,
                      height: 100,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'KSH',
                      style: TextStyle(
                        color: Color(0xff205072),
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Account Settings'),
                onTap: () {
                  setState(() {
                    _isButtonClicked = true;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => update_email()),
                  );
                  // Add your functionality for the Settings option here
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('About'),
                onTap: () {
                  setState(() {
                    _isButtonClicked = true;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => about()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Logout Confirmation'),
                        content: Text('Are you sure you want to logout?'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: Text('Logout'),
                            onPressed: () {
                              // Perform logout action here
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LoginScreen()),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),

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

                SafeArea(

                  child: Column(
                    children: [

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                                Image.asset(
                              'assets/images/Icons.png',
                              width: 120,
                              height: 100,
                            ),

                          ]),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isButtonClicked = true;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Checkup(),
                                        ));
                                    // add your logic for the male button here
                                  },
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Kidney Checkup",
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Color(0xff205072),
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        Image.asset(
                                          'assets/images/check.jpeg',
                                          width: 120,
                                          height: 100,
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isButtonClicked = true;
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GFR()),
                                    );
                                  },
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "GFR Calculation",
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Color(0xff205072),
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        Image.asset(
                                          'assets/images/Picsart_23-03-27_21-41-43-760.png',
                                          width: 120,
                                          height: 100,
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isButtonClicked = true;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BMI(),
                                        ));

                                    // add your logic for the male button here
                                  },
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "BMI Calculation",
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Color(0xff205072),
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        Image.asset(
                                          'assets/images/BMI (2).png',
                                          width: 120,
                                          height: 100,
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isButtonClicked = true;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => advice(),
                                        ));
                                  },
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Advices For Kidney",
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: Color(0xff205072),
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        Image.asset(
                                          'assets/images/advice.jpeg',
                                          width: 120,
                                          height: 100,
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isButtonClicked = true;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => about(),
                                        ));
                                  },
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "About",
                                          style: TextStyle(
                                            color: Color(0xff205072),
                                            fontSize: 25.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 7.0,
                                        ),
                                        Image.asset(
                                          'assets/images/Icons.png',
                                          width: 120,
                                          height: 100,
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],


            )
        )
        ));
  }
}
