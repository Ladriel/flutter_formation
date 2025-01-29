import 'package:flutter/material.dart';
import 'package:flutter_formation/core/strings.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
            ),
            label: Strings.pokedexTab),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: Strings.favoritesTab),
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: theme.colorScheme.secondaryContainer,
      selectedItemColor: theme.colorScheme.onSecondaryContainer,
      selectedFontSize: 16,
      unselectedItemColor: theme.colorScheme.onSecondaryContainer.withAlpha(75),
      currentIndex: currentIndex,
      onTap: onTap,
    );
  }
}
