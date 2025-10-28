import 'package:flutter/material.dart';
import 'package:laundry_load_planner/splashscreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true, //Apply Material Design 3 (New Layout) to the widget
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent) //Primary Color
        ),
      home: SplashScreen()
    );
  }
}
