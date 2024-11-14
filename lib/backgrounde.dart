import 'package:flutter/material.dart';

Widget background(String img) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.fill)),
  );
}

Widget colorsbackground() {
  return Container(
    color: Colors.black.withOpacity(0.0),
  );
}
