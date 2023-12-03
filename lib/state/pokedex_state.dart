import 'package:flutter/cupertino.dart';
import 'package:flutter_formation/data/models/pokedex_entry.dart';

import 'package:flutter_formation/data/repository.dart';

import 'package:flutter_formation/data/poke_api.dart';

class PokedexState with ChangeNotifier {
  bool loading = true;
  String? error;
  List<PokedexEntry>? entries = <PokedexEntry>[];

  PokedexState() {
    fetchPokedexEntries();
  }

  fetchPokedexEntries() async {
    Repository repository = Repository(pokemonAPIClient: PokeAPIClient());
    try {
      entries = await repository.getPokedexEntries();
    } catch (e) {
      print("error $e");
      error = e.toString();
    }
    loading = false;
    notifyListeners();
  }
}