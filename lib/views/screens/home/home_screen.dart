import 'package:flutter/material.dart';
import 'package:flutter_formation/views/screens/favorites/favorites_screen.dart';
import 'package:flutter_formation/views/screens/pokedex/pokedex_screen.dart';
import 'package:flutter_formation/views/widgets/bottom_bar.dart';

import 'package:flutter_formation/views/widgets/header_bar.dart';

import 'package:flutter_formation/core/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  int currentIndex = 0;
  final tabs = [Strings.pokedexTab, Strings.favoritesTab];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(title: tabs[currentIndex]),
      body: DefaultTabController(
        length: 2,
        child: IndexedStack(
          index: currentIndex,
          children: const [
            PokedexScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}
