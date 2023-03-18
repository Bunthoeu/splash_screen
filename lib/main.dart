import 'package:flutter/material.dart';
import 'package:onborading_screen/splash_screen/splash_screen.dart';
import 'package:overlay_support/overlay_support.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: IntroScreen()),
    );
  }
}


