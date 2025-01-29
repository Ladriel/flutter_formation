import 'package:flutter/material.dart';
import 'package:flutter_formation/state/pokemon_detail.dart';
import 'package:flutter_formation/views/screens/pokedex/components/pokedex_card_data.dart';
import 'package:flutter_formation/views/screens/detail/pokemon_detail_screen.dart';

import 'package:flutter_formation/data/models/pokedex_entry.dart';
import 'package:provider/provider.dart';

import 'package:flutter_formation/state/favorites_state.dart';

class PokedexEntryCard extends StatelessWidget {
  final double size;
  final PokedexEntry pokedexEntry;

  const PokedexEntryCard({
    Key? key,
    required this.pokedexEntry,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider<PokemonDetailState>(
                create: (_) => PokemonDetailState(pokedexEntry),
                builder: (context, _) => PokemonDetailScreen(),
              ),
            ),
          );
        },
        child: Card(
          child: PokedexCardData(
            name: pokedexEntry.name,
            imageUrl: pokedexEntry.sprite,
            id: pokedexEntry.number.toString(),
          ),
        ),
      ),
    );
  }
}
