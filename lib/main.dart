import 'package:flutter/material.dart';
import 'package:quiz_app_firebase/Screens/homescreen.dart';
import 'package:quiz_app_firebase/Screens/splash_loadingscreen.dart';

void main() {
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(
      
      ),
      home: SplashScreen (),
    );
  }
}

