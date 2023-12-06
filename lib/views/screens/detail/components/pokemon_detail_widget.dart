import 'package:flutter/cupertino.dart';
import 'package:flutter_formation/data/models/pokedex_entry.dart';

import 'package:flutter_formation/data/models/pokemon_detail.dart';
import 'package:flutter_formation/state/favorites_state.dart';

import 'package:flutter_formation/views/screens/detail/components/favorite_button.dart';
import 'package:provider/provider.dart';

import 'detail_image.dart';
import 'detail_title.dart';
import 'detail_types.dart';

class PokemonDetailWidget extends StatelessWidget {
  final PokedexEntry entry;
  final PokemonDetail detail;

  const PokemonDetailWidget({
    super.key,
    required this.detail,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    FavoritesState favoriteState = Provider.of<FavoritesState>(context);
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DetailTitle(id: detail.id, name: detail.name),
                  FavoriteButton(
                    isFavorite: favoriteState.favorites.contains(entry),
                    callBack: () {
                      if (favoriteState.isFavorite(entry)) {
                        favoriteState.removeFavorite(entry);
                      } else {
                        favoriteState.addFavorite(entry);
                      }
                    },
                  ),
                ],
              ),
            ),
            DetailImage(
              image: detail.artwork,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DetailTypes(types: detail.types),
            )
          ],
        ),
      ),
    );
  }
}
