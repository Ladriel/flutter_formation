import 'package:flutter/cupertino.dart';
import 'package:flutter_formation/data/models/pokedex_entry.dart';
import 'package:flutter_formation/data/repository.dart';

class PokedexState with ChangeNotifier {
  bool loading = true;
  String? error;
  List<PokedexEntry>? entries = <PokedexEntry>[];

  PokedexState() {
    fetchPokedexEntries();
  }

  fetchPokedexEntries() async {
    try {
      entries = await Repository().getPokedexEntries();
    } catch (e) {
      print("error $e");
      error = e.toString();
    }
    loading = false;
    notifyListeners();
  }
}