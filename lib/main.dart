import 'package:flutter/material.dart';
import 'package:flutter_formation/core/strings.dart';
import 'package:flutter_formation/core/theme.dart';
import 'package:flutter_formation/views/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppTheme>(
      create: (context) => AppTheme(AppTheme.lightTheme),
      builder: (context, _) {
        return MaterialApp(
          title: Strings.appTitle,
          theme: Provider.of<AppTheme>(context).theme,
          home: HomeScreen(title: Strings.homeTitle,),
        );
      },
    );
  }
}