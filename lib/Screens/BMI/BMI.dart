import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ksh/Screens/BMI/bmi_result.dart';

import '../../Customs/Custom_BMI_button.dart';
import '../../Customs/Custom_BMI_textfield.dart';

class BMI extends StatefulWidget {
  @override
  State<BMI> createState() => BMIState();
}

class BMIState extends State<BMI> {
  final _formKey = GlobalKey<FormState>();
  bool _isMale = true;
  double _weight = 40;
  int _age = 20;
  double _height = 120;

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
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
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

                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'BMI Calculator',
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
                                    'assets/images/BMI (2).png',
                                    width: 140,
                                    height: 100,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Gender",
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    height: 60,
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _isMale = true;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                        ),
                                        primary:
                                        _isMale ? Colors.blue : Colors.grey[300],
                                      ),
                                      child: Text(
                                        'Male',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    height: 60,
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _isMale = false;
                                        });
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                        ),
                                        primary:
                                        !_isMale ? Colors.blue : Colors.grey[300],
                                      ),
                                      child: Text(
                                        'Female',
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 90,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Height',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      labelText: 'Height',
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return 'Please enter the value';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _height = double.parse(value!);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Weight',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
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
                                        _weight = double.parse(value!);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    'Age',
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Expanded(
                                    child: CustomTextField(
                                      labelText: 'Age',
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if (value?.isEmpty ?? true) {
                                          return 'Please enter your Age';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _age = int.parse(value!);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 65,
                                  ),
                                  CustomBButton(
                                    text: "CALCULATE",
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        double bmi = _weight / pow(_height / 100, 2);
                                        int result = _calculateBMIResult(bmi);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => bmi_result(
                                              age: _age,
                                              isMale: _isMale,
                                              result: result,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
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

  int _calculateBMIResult(double bmi) {
    if (bmi < 18.5) {
      return 0; // Underweight
    } else if (bmi >= 18.5 && bmi < 25) {
      return 1; // Normal weight
    } else if (bmi >= 25 && bmi < 30) {
      return 2; // Overweight
    } else {
      return 3; // Obese
    }
  }
}
