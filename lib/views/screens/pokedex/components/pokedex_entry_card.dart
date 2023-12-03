import 'package:flutter/material.dart';
import 'package:flutter_formation/views/screens/pokedex/components/pokedex_card_background.dart';
import 'package:flutter_formation/views/screens/pokedex/components/pokedex_card_data.dart';
import 'package:flutter_formation/views/screens/detail/pokemon_detail_screen.dart';

class PokedexEntryCard extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;

  const PokedexEntryCard({
    Key? key,
    required this.id,
    required this.name,
    required this.imageUrl,
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
      onTap : () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PokemonDetailScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: getContainerDecoration(),
        child: Stack(
          children: [
            PokedexCardBackground(id: id),
            PokedexCardData(name: name, imageUrl: imageUrl),
          ],
        ),
      ),
    );
  }
}