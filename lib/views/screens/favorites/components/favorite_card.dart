import 'package:flutter/material.dart';

import 'package:flutter_formation/data/models/pokedex_entry.dart';

class FavoriteCard extends StatelessWidget {
  final PokedexEntry entry;

  const FavoriteCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 3,
              child: Image.network(
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/transparent/${entry.number}.png",
                fit: BoxFit.contain,
                alignment: Alignment.center,
              ),
            ),
            Flexible(flex: 3, child: Text(entry.name)),
            Flexible(flex: 4, child: _lifeBar()),
          ],
        ),
      ),
    );
  }

  Widget _lifeBar() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          height: 20,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.lightGreen,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          height: 10,
        ),
      ],
    );
  }
}
