import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

class FavoritesState with ChangeNotifier {
  List<String> _favorites = [];

  List<String> get favorites => _favorites;

  set favorites(List<String> value) {
    _favorites = value;
    notifyListeners();
  }

  addFavorite(String name) {
    _favorites.add(name);
    notifyListeners();
  }
}