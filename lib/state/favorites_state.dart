import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_formation/data/models/pokedex_entry.dart';
import 'package:flutter_formation/data/repository.dart';
//import 'package:provider/provider.dart';

class FavoritesState with ChangeNotifier {
  FavoritesState({List<PokedexEntry>? favs}) {
    if (favs != null) {
      favorites = favs;
    } else {
      initFavorites();
    }
  }

  List<PokedexEntry> _favorites = [];

  List<PokedexEntry> get favorites => _favorites;

  Future<void> initFavorites() async {
    String? storageFavs =
        await Repository().getStorageValue(Repository.favoriteStorageKey);
    if (storageFavs != null) {
      FavoritesState state = FavoritesState.fromJson(storageFavs);
      _favorites = state.favorites;
      notifyListeners();
    }
  }

  set favorites(List<PokedexEntry> value) {
    _favorites = value;
    Repository().setStorageValue(Repository.favoriteStorageKey, toJson());
    notifyListeners();
  }

  addFavorite(PokedexEntry value) {
    if (!_favorites.contains(value)) {
      _favorites.add(value);
      Repository().setStorageValue(Repository.favoriteStorageKey, toJson());
      notifyListeners();
    }
  }

  removeFavorite(PokedexEntry value) {
    if (_favorites.contains(value)) {
      _favorites.remove(value);
      Repository().setStorageValue(Repository.favoriteStorageKey, toJson());
      notifyListeners();
    }
  }

  isFavorite(PokedexEntry value) {
    return _favorites.contains(value);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'favorites': favorites.map((x) => x.toMap()).toList(),
    };
  }

  factory FavoritesState.fromMap(Map<String, dynamic> map) {
    return FavoritesState(
      favs: List<PokedexEntry>.from(
        (map['favorites'] as List<dynamic>).map<PokedexEntry>(
          (x) => PokedexEntry.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoritesState.fromJson(String source) =>
      FavoritesState.fromMap(json.decode(source) as Map<String, dynamic>);
}
