import 'package:flutter/material.dart';

import 'package:flutter_formation/data/models/pokemon_detail.dart';

class DetailTypes extends StatelessWidget {
  final List<PokemonTypes> types;
  const DetailTypes({Key? key, required this.types}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Image.asset(
        'assets/${types[0].type.name}.png',
        fit: BoxFit.contain,
      ),
      if (types.length > 1)
        Image.asset(
          'assets/${types[1].type.name}.png',
          fit: BoxFit.contain,
        )
    ]);
  }
}
