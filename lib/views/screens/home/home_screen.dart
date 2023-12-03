import 'package:flutter/material.dart';
import 'package:flutter_formation/views/screens/favorites/favorites_screen.dart';
import 'package:flutter_formation/views/screens/pokedex/pokedex_screen.dart';

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
  List<String> favorites = [];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: HeaderBar(title: widget.title),
      body: DefaultTabController(
        length: 2,
        child: IndexedStack(
          index: currentIndex,
          children: [
            PokedexScreen(
              callBack: (name) {
                setState(
                  () {
                    favorites.add(name);
                  },
                );
              },
            ),
            FavoritesScreen(
              favorites: favorites,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _getTabs(),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: theme.colorScheme.onPrimary,
        backgroundColor: theme.colorScheme.primary,
        unselectedItemColor: theme.colorScheme.onPrimary.withAlpha(125),
        selectedFontSize: 16,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _getTabs() {
    return [
      BottomNavigationBarItem(
          icon: Icon(Icons.list), label: Strings.pokedexTab),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite), label: Strings.favoritesTab),
    ];
  }
}
