import 'package:flutter/material.dart';

Widget transition(String txt, AnimationController controller) {
  return SlideTransition(
      position: Tween<Offset>(begin: Offset(0.0, -0.9), end: Offset.zero)
          .animate(controller),
      child: Text(
        txt,
        style: TextStyle(color: Colors.white12.withOpacity(0.8), fontSize: 20),
        textAlign: TextAlign.center,
      ));
}
