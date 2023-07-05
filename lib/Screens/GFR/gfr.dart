import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ksh/globals.dart';
import 'package:ksh/Screens/GFR/table.dart';

import '../../Customs/Custom_BMI_textfield.dart';

class GFR extends StatefulWidget {
  const GFR({Key? key}) : super(key: key);

  @override
  GFRState createState() => GFRState();
}

class GFRState extends State<GFR> {
  final formKey = GlobalKey<FormState>();

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
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.arrow_back),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    color: const Color(0xff205072),
                                  ),
                                ],
                              ),
                                   Row(
                                     children: [
                                       Expanded(
                                        child: Center(
                                          child: Text(
                                            'GFR TEST',
                                            style: TextStyle(
                                              shadows: [
                                                Shadow(
                                                  color: Colors.black,
                                                  blurRadius: 4.0,
                                                  offset: Offset(4.0, 4.0),
                                                ),
                                              ],
                                              fontSize: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                  ),
                                     ],
                                   ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/Picsart_23-03-27_21-41-43-760.png',
                                    width: 140,
                                    height: 100,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Gender",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    height: 60,
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          isMale = true;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                        ),
                                        backgroundColor: isMale
                                            ? Colors.blue
                                            : Colors.grey[300],
                                      ),
                                      child: const Text(
                                        'Male',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    height: 60,
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          isMale = false;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                        ),
                                        backgroundColor: !isMale
                                            ? Colors.blue
                                            : Colors.grey[300],
                                      ),
                                      child: const Text(
                                        'Female',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Row(
                                children: [
                                  Text(
                                    "Note :- To convert creatinine from \n mg/dL to µmol/L, divide by 88",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    'Creatinine',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      labelText: 'Creatinine',
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return 'Please enter the value';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          creatinine = value; // Assign the value to creatinine
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Text(
                                    'Weight',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 47,
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      labelText: 'Weight',
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return 'Please enter the value';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          Weight = value; // Assign the value to Weight
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Text(
                                    'Age',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 85,
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      labelText: 'Age',
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return 'Please enter the value';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          Age = value; // Assign the value to Age
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                height: 60,
                                width: 200,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.blue,
                                  ),
                                  child: MaterialButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();
                                        await calculateGFR();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                TableActivity(gfr: gfr),
                                          ),
                                        );
                                      }
                                    },
                                    height: 50.0,
                                    child: const Text(
                                      "CALCULATE",
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> calculateGFR() async {
  if (creatinine != null && Weight != null && Age != null) {
    double creatinineValue = double.parse(creatinine!);
    double weight = double.parse(Weight!);
    int age = int.parse(Age!);
    double k = isMale ? 1 : 0.85;
    gfr = ((140 - age) * weight * k) / (72 * creatinineValue);
    gfr = double.parse(gfr.toStringAsFixed(2));
  }
}
