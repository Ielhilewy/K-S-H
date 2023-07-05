import 'dart:ui';

import 'package:flutter/material.dart';

class about extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 300, sigmaY: 500.0),
              child: Image.asset(
                'assets/images/gfr.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Color(0xff205072),
                        ),
                        SizedBox(width: 50),
                      ],
                    ),
                    SizedBox(height: 50),
                    Container(
                      height: 1300,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'assets/images/Icons.png',
                                width: 140,
                                height: 100,
                              ),
                            ),
                            Text(
                              'Welcome to our kidney health management application, designed to help you take control of your kidney health. Our app includes a range of features to help you monitor and manage your kidney health, including:',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              '-GFR Calculation: Our GFR calculation feature helps you determine the severity of your kidney disease, by calculating your glomerular filtration rate (GFR) based on your age, sex, and blood creatinine level. GFR is an important measure of kidney function, and can help you understand the current state of your kidney health.\n',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 16
                                                                  ),

                            ),
                            Text(
                              '-Kidney Checkup: Our kidney checkup feature allows you to upload your x-rays to explore if your kidneys contain tumors or stones. Regular checkups are important for maintaining good kidney health, and our app makes it easy to schedule and manage your appointments.\n',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '-BMI Calculator: Our BMI calculator feature helps you track your weight and monitor your kidney health. Maintaining a healthy weight is important for kidney health, and our app provides you with a quick and easy way to calculate your BMI and track your progress over time.\n',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '-Booking: Our app allows you to book appointments at hospitals based on the severity of your kidney disease. The system reserves places for patients by determining the degree of severity of their condition and reserving places in terms of priority for the most serious cases.\n',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '-Advice on Kidney Health: Our app also includes a range of advice on maintaining good kidney health, such as eating a healthy diet, staying hydrated, avoiding smoking and excessive alcohol consumption, and managing medical conditions like diabetes and high blood pressure. We believe that by taking an active role in managing your kidney health, you can improve your quality of life and reduce the risk of serious health problems.\n',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'We are committed to helping you manage your kidney health and live a healthier, happier life. Download our app today and take the first step towards better kidney health!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
