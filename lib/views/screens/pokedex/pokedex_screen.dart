import 'package:flutter/material.dart';

import 'package:flutter_formation/views/screens/pokedex/components/pokedex_entry_card.dart';

import 'package:flutter_formation/data/models/pokedex_entry.dart';

import 'package:flutter_formation/data/poke_api.dart';
import 'package:flutter_formation/data/repository.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen(
      {super.key,});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  bool loading = true;
  String? error;
  List<PokedexEntry>? entries = <PokedexEntry>[];

  @override
  void initState() {
    super.initState();
    Repository repository = Repository(pokemonAPIClient: PokeAPIClient());
    try {
      repository.getPokedexEntries().then(
            (value) => setState(
              () {
                loading = false;
                entries = value;
              },
            ),
          );
    } catch (e) {
      print("error $e");
      setState(
        () {
          loading = false;
          error = e.toString();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          loading
              ? CircularProgressIndicator()
              : error != null
                  ? Text("Une erreur est survenue !")
                  : entries != null
                      ? Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: entries!
                                .map(
                                  (entry) => PokedexEntryCard(
                                    entry: entry,
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      : Text("Aucun pokemons !"),
        ],
      ),
    );
  }
}
