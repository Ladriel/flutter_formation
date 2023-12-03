import 'package:flutter/material.dart';
import 'package:flutter_formation/data/models/pokedex_entry.dart';
//import 'package:provider/provider.dart';

class FavoritesState with ChangeNotifier {
  List<PokedexEntry> _favorites = [];

  List<PokedexEntry> get favorites => _favorites;

  set favorites(List<PokedexEntry> value) {
    _favorites = value;
    notifyListeners();
  }

  addFavorite(PokedexEntry value) {
    if (!_favorites.contains(value)) {
      _favorites.add(value);
      notifyListeners();
    }
  }

  removeFavorite(PokedexEntry value) {
    if (_favorites.contains(value)) {
      _favorites.remove(value);
      notifyListeners();
    }
  }

  isFavorite(PokedexEntry value) {
    return _favorites.contains(value);
  }
}