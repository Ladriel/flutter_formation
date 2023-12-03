import 'package:flutter/material.dart';
import 'package:flutter_formation/views/screens/pokedex/components/pokedex_card_background.dart';
import 'package:flutter_formation/views/screens/pokedex/components/pokedex_card_data.dart';
import 'package:flutter_formation/views/screens/detail/pokemon_detail_screen.dart';

import 'package:flutter_formation/data/models/pokedex_entry.dart';

class PokedexEntryCard extends StatelessWidget {
  final PokedexEntry pokedexEntry;

  const PokedexEntryCard({
    Key? key,
    required this.pokedexEntry,
  }) : super(key: key);

  BoxDecoration getContainerDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.grey.withOpacity(0.24),
          width: 1,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PokemonDetailScreen(entry: pokedexEntry)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: getContainerDecoration(),
        child: Stack(
          children: [
            PokedexCardBackground(id: pokedexEntry.number),
            PokedexCardData(name: pokedexEntry.name, imageUrl: pokedexEntry.sprite),
          ],
        ),
      ),
    );
  }
}
