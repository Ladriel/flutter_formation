import 'package:flutter_formation/data/poke_api.dart';
import 'package:flutter_formation/data/models/pokedex_entry.dart';

// The Repository handles our different data sources (network, cache, local db)
// This is were we make the switch from pure datas to our model dtos
class Repository {
  final PokeAPIClient pokemonAPIClient;

  Repository({required this.pokemonAPIClient});

  Future<List<PokedexEntry>> getPokedexEntries() async {
    final entriesDatas = await pokemonAPIClient.fetchPokedexEntriesDatas();
    List<PokedexEntry> result = entriesDatas.map((entry) => PokedexEntry.fromMap(entry)).toList();
    print("entries $result");
    return result;
  }
}