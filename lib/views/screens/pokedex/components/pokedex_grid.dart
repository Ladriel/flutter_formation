import 'package:flutter/material.dart';
import 'package:flutter_formation/data/models/pokedex_entry.dart';
import 'package:flutter_formation/views/screens/pokedex/components/pokedex_entry_card.dart';

class PokedexGrid extends StatelessWidget {
  final List<PokedexEntry> entries;

  const PokedexGrid({Key? key, required this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final space = MediaQuery.of(context).size.width;
    const childSize = 120.0;
    final crossAxisCount = (space / childSize).toInt();
    return GridView.count(
        padding: const EdgeInsets.all(7),
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        semanticChildCount: 151,
        physics: const BouncingScrollPhysics(),
        children: entries
            .map(
              (entry) => PokedexEntryCard(
                size: childSize,
                pokedexEntry: entry,
              ),
            )
            .toList());
  }
}
