import 'package:flutter/material.dart';

import '../../data/models/pokedex_entry.dart';

class PokedexEntryCard extends StatelessWidget {
  final PokedexEntry entry;

  const PokedexEntryCard({
    super.key,
    required this.entry,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Card(
        color: theme.colorScheme.background,
        child: Center(
          child: Text(
            entry.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: theme.colorScheme.onBackground,
            ),
          ),
        ),
      ),
    );
  }
}
