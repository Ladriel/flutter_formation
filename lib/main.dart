import 'package:flutter/material.dart';
import 'package:flutter_formation/core/strings.dart';
import 'package:flutter_formation/core/theme.dart';
import 'package:flutter_formation/state/favorites_state.dart';
import 'package:flutter_formation/state/pokedex_state.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppTheme>(
          create: (_) => AppTheme(AppTheme.lightTheme),
        ),
        ChangeNotifierProvider<PokedexState>(
          create: (_) => PokedexState(),
        ),
        ChangeNotifierProvider<FavoritesState>(
          create: (_) => FavoritesState(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        title: Strings.appTitle,
        theme: Provider.of<AppTheme>(context).theme,
        home: HomeScreen(
          title: Strings.homeTitle,
        ),
      ),
    );
  }
}
