import 'package:flutter/material.dart';

class PokedexCardBackground extends StatelessWidget {

  final int id;

  const PokedexCardBackground({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "$id",
      style: TextStyle(
        fontSize: 80,
        fontWeight: FontWeight.bold,
        color: Colors.grey[200],
      ),
    );
  }
}
