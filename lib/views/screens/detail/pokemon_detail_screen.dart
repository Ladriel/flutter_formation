import 'package:flutter/material.dart';
import 'package:flutter_formation/views/widgets/header_bar.dart';

import 'package:flutter_formation/core/strings.dart';

class PokemonDetailScreen extends StatefulWidget {
  const PokemonDetailScreen({super.key});

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(title: Strings.detailScreenTitle,),
      body: Center(child: Text("To be coming"),),
    );
  }
}
