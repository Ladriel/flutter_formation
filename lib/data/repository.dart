import 'package:flutter_formation/data/poke_api.dart';
import 'package:flutter_formation/data/models/pokedex_entry.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/pokemon_detail.dart';

// The Repository handles our different data sources (network, cache, local db)
// This is were we make the switch from pure datas to our model dtos
class Repository {
  static final PokeAPIClient pokemonAPIClient = PokeAPIClient();
  static final Future<SharedPreferences> prefStorage = SharedPreferences.getInstance();
  static const favoriteStorageKey = "local_favs";

  Future<List<PokedexEntry>> getPokedexEntries() async {
    final entriesDatas = await pokemonAPIClient.fetchPokedexEntriesDatas();
    List<PokedexEntry> result = entriesDatas.map((entry) => PokedexEntry.fromMap(entry)).toList();
    print("entries $result");
    return result;
  }

  Future<PokemonDetail> getPokemonDetail(String name) async {
    final pokemonData = await pokemonAPIClient.fetchPokemonDetail(name);
    return PokemonDetail.fromMap(pokemonData);
  }

  Future<String?> getStorageValue(String key) async {
    SharedPreferences prefs = await prefStorage;
    return prefs.getString(key);
  }

  Future<bool> setStorageValue(String key, String value) async {
    SharedPreferences prefs = await prefStorage;
    return prefs.setString(key, value);
  }
}