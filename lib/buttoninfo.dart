import 'package:flutter/material.dart';

Widget buttoninfo(String text,  VoidCallback onTap) {
  return Material(
    borderRadius: BorderRadius.circular(25),
    color: Colors.blue.withOpacity(0.5), // Correction : 'Colors.blue' plutôt que 'Color(blue)'
    elevation: 4.0,
    shadowColor: Colors.lightBlueAccent,
    child: InkWell(
      onTap: onTap,
      splashColor: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black, // Correction : 'Colors.black' plutôt que 'colors.black'
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    ),
  );
}
