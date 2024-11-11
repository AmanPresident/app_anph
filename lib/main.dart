// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'backgrounde.dart';
import 'transitionOne.dart';
import 'EcranDeux.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "EcranDeux": (BuildContext context) => EcranDeux(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  startimer() async {
    Duration duration = Duration(seconds: 5);
    return Timer(duration, navigatePage);
  }

  void navigatePage() =>
      Navigator.of(context).pushReplacementNamed('EcranDeux');

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );

    animation = Tween<double>(begin: 0.0, end: 0.9).animate(controller)
      ..addListener(() {
        setState(() {
          // Vous pouvez ajouter du code ici si nécessaire pour mettre à jour l'état
        });
      });
    startimer();
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose(); // Disposez de l'AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          background(
              'images/111.jpeg'), // Assurez-vous que le widget 'Background' existe
          colorsbackground(), // Assurez-vous que le widget 'ColorsBackground' existe

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Column(
                  children: <Widget>[
  const SizedBox(height: 155),
  transition("", controller),
 
  
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
