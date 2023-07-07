import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ksh/Screens/GFR/Booking.dart';
import 'package:ksh/globals.dart';
import 'package:ksh/Screens/HOME/home.dart';
import 'package:ksh/Screens/GFR/gfr.dart';
class TableActivity extends StatefulWidget {
  final double gfr;
  TableActivity({required this.gfr});
  @override
  TableActivityState createState() => TableActivityState();
}
class TableActivityState extends State<TableActivity> {
  double get gfr => widget.gfr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ...
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        buildAppBar(),
                        buildTable(),
                      ],
                    ),
                  ),
                  buildBookingButton(),
                  SizedBox(height: 20),
                  buildReturnHomeButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAppBar() {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color(0xff205072),
        ),
        SizedBox(
          width: 50,
        ),
        Expanded(
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
        Image.asset(
          'assets/images/Picsart_23-03-27_21-41-43-760.png',
          width: 120,
          height: 100,
        ),
      ],
    );
  }

  Widget buildTable() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Table(
          border: TableBorder.all(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(15),
          ),
          children: [
            buildTableRow(
                ['Category', 'GFR(ml/min/1.73m2)', 'Renal filtration']),
            buildTableRow(['G1', 'Normal or High', 'More than equal 90'],
                (gfr >= 90) ? Colors.green : null),
            buildTableRow(['G2', 'Mildly decreased', 'From 60 to 89'],
                (gfr >= 60 && gfr <= 89) ? Colors.lightGreen : null),
            buildTableRow(
                ['G3A', 'Mildly to moderately decreased', 'From 45 to 59'],
                (gfr >= 45 && gfr <= 59) ? Colors.orange : null),
            buildTableRow(
                ['G3B', 'Mildly to severely decreased', 'From 30 to 44'],
                (gfr >= 30 && gfr <= 44) ? Colors.orange : null),
            buildTableRow(['G4', 'Severely decreased', 'From 15 to 29'],
                (gfr >= 15 && gfr <= 29) ? Colors.orange : null),
            buildTableRow(['G5', 'Kidney failure', 'Less than 15'],
                (gfr < 15) ? Colors.red : null),
          ],
        ),
      ),
    );
  }

  TableRow buildTableRow(List<String> cells, [Color? backgroundColor]) {
    return TableRow(
      decoration: BoxDecoration(color: backgroundColor),
      children: cells.map((cell) {
        return TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cell,
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget buildBookingButton() {
    return SizedBox(
      height: 60,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Booking(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          'Booking',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget buildReturnHomeButton() {
    return SizedBox(
      height: 60,
      width: 200,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => home(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          'Return to Home',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
