import 'package:flutter/material.dart';

class CustomB extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;

  const CustomB({
    required this.text,
    required this.onPressed,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          minimumSize: Size(width, 50), // Set the minimumSize to control the width
        ),
      ),
    );
  }
}
