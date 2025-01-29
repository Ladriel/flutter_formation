import 'package:flutter/material.dart';
import 'package:flutter_formation/state/favorites_state.dart';
import 'package:flutter_formation/state/pokemon_detail.dart';
import 'package:flutter_formation/views/screens/detail/components/pokemon_detail_widget.dart';
import 'package:flutter_formation/views/widgets/header_bar.dart';
import 'package:provider/provider.dart';

import 'package:flutter_formation/core/strings.dart';

import 'components/favorite_button.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final detailState = Provider.of<PokemonDetailState>(context);
    final favoriteState = Provider.of<FavoritesState>(context);
    final detail = detailState.detail;

    return Scaffold(
      appBar: HeaderBar(
        title: Strings.detailScreenTitle,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            detailState.loading
                ? CircularProgressIndicator()
                : detailState.error != null
                    ? Text(Strings.error)
                    : detail != null
                        ? PokemonDetailWidget(
                            entry: detailState.entry,
                            detail: detail,
                          )
                        : Text(Strings.empty),
          ],
        ),
      ),
      floatingActionButton: FavoriteButton(
        isFavorite: favoriteState.favorites.contains(detailState.entry),
        callBack: () {
          if (favoriteState.isFavorite(detailState.entry)) {
            favoriteState.removeFavorite(detailState.entry);
          } else {
            favoriteState.addFavorite(detailState.entry);
          }
        },
      ),
    );
  }
}
