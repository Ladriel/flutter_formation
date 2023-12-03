import 'package:flutter/material.dart';

import 'package:flutter_formation/data/models/pokedex_entry.dart';
import 'package:flutter_formation/state/favorites_state.dart';
import 'package:flutter_formation/views/screens/detail/pokemon_detail_screen.dart';

import 'package:flutter_formation/views/widgets/favorite_button.dart';
import 'package:provider/provider.dart';

class PokedexEntryCard extends StatelessWidget {
  final PokedexEntry entry;

  const PokedexEntryCard({
    super.key,
    required this.entry,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PokemonDetailScreen()),
          );
        },
        child: Card(
          color: theme.colorScheme.background,
          child: Center(
            child: Row(
              children: [
                FavoriteButton(
                  callBack: () {
                    // could use Consumer
                    Provider.of<FavoritesState>(context, listen: false).addFavorite(entry.name);
                  },
                ),
                Text(
                  entry.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
