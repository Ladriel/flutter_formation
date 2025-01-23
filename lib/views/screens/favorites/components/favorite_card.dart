import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_formation/data/models/pokedex_entry.dart';
import 'package:flutter_formation/views/widgets/animation_widget.dart';

class FavoriteCard extends StatelessWidget {
  final PokedexEntry entry;
  final double healthPercent; // ex: 0.5 for a half HP Pokemon

  const FavoriteCard({
    super.key,
    required this.entry,
    required this.healthPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimationWidget(
                    key: Key("anim_${entry.number}_$healthPercent"),
                    duration: Duration(
                        milliseconds: (1100 - (1000 * healthPercent)).toInt()),
                    child: Image.network(
                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/versions/generation-i/red-blue/transparent/${entry.number}.png",
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(entry.name),
                  ),
                ],
              ),
            ),
            Flexible(flex: 3, child: _lifeBar(healthPercent, context)),
          ],
        ),
      ),
    );
  }

  Widget _lifeBar(double ratio, BuildContext context) {
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
        Align(
          alignment: Alignment.centerLeft,
          child: FractionallySizedBox(
            widthFactor: ratio,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              height: 10,
            ),
          ),
        ),
      ],
    );
  }
}
