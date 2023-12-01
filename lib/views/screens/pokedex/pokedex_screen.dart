import 'package:flutter/material.dart';

import 'package:flutter_formation/views/screens/pokedex/components/pokedex_entry_card.dart';

import 'package:flutter_formation/data/models/pokedex_entry.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  List<PokedexEntry> entries = <PokedexEntry>[
    PokedexEntry(name: "Bulbizarre", number: 1, sprite: "1.png"),
    PokedexEntry(name: "Salamèche", number: 4, sprite: "4.png"),
    PokedexEntry(name: "Carapuce", number: 7, sprite: "7.png"),
    PokedexEntry(name: "Bulbizarre", number: 1, sprite: "1.png"),
    PokedexEntry(name: "Salamèche", number: 4, sprite: "4.png"),
    PokedexEntry(name: "Carapuce", number: 7, sprite: "7.png"),
    PokedexEntry(name: "Bulbizarre", number: 1, sprite: "1.png"),
    PokedexEntry(name: "Salamèche", number: 4, sprite: "4.png"),
    PokedexEntry(name: "Carapuce", number: 7, sprite: "7.png"),
    PokedexEntry(name: "Bulbizarre", number: 1, sprite: "1.png"),
    PokedexEntry(name: "Salamèche", number: 4, sprite: "4.png"),
    PokedexEntry(name: "Carapuce", number: 7, sprite: "7.png"),
    PokedexEntry(name: "Bulbizarre", number: 1, sprite: "1.png"),
    PokedexEntry(name: "Salamèche", number: 4, sprite: "4.png"),
    PokedexEntry(name: "Carapuce", number: 7, sprite: "7.png"),
    PokedexEntry(name: "Bulbizarre", number: 1, sprite: "1.png"),
    PokedexEntry(name: "Salamèche", number: 4, sprite: "4.png"),
    PokedexEntry(name: "Carapuce", number: 7, sprite: "7.png"),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: entries
                  .map(
                    (entry) => PokedexEntryCard(
                      entry: entry,
                      theme: theme,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
