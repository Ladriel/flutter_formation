import 'package:flutter/material.dart';
import 'package:flutter_formation/data/models/pokedex_entry.dart';
import 'package:flutter_formation/views/screens/pokedex/components/pokedex_entry_card.dart';

class PokedexGrid extends StatelessWidget {
  final List<PokedexEntry> entries;

  const PokedexGrid({Key? key, required this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = (width > 1000)
        ? 5
        : (width > 700)
            ? 4
            : (width > 450)
                ? 3
                : 2;
    return GridView.count(
        padding: const EdgeInsets.all(7),
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        semanticChildCount: 250,
        childAspectRatio: 200 / 244,
        physics: const BouncingScrollPhysics(),
        children: entries
            .map(
              (entry) => PokedexEntryCard(
                pokedexEntry: entry,
              ),
            )
            .toList());
  }
}
