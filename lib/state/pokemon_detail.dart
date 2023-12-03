import 'package:flutter/cupertino.dart';

import 'package:flutter_formation/data/models/pokedex_entry.dart';

import 'package:flutter_formation/data/repository.dart';

import 'package:flutter_formation/data/models/pokemon_detail.dart';

class PokemonDetailState with ChangeNotifier {
  final PokedexEntry entry;
  bool loading = true;
  String? error;
  PokemonDetail? detail;

  PokemonDetailState(this.entry) {
    fetchPokedexEntries();
  }

  fetchPokedexEntries() async {
    try {
      detail = await Repository().getPokemonDetail(entry.name);
    } catch (e) {
      print("error $e");
      error = e.toString();
    }
    loading = false;
    notifyListeners();
  }
}