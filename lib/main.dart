import 'package:flutter/material.dart';
import 'package:flutter_formation/core/strings.dart';
import 'package:flutter_formation/core/theme.dart';
import 'package:flutter_formation/views/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(title: Strings.homeTitle,),
    );
  }
}