import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_formation/state/favorites_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter_formation/core/strings.dart';
import 'components/favorite_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // could use Provider.of
    return Consumer<FavoritesState>(
      builder: (context, favoritesState, _) =>
          favoritesState.favorites.isNotEmpty
              ? ListView(
                  shrinkWrap: true,
                  children: favoritesState.favorites
                      .map(
                        (fav) => FavoriteCard(
                          entry: fav,
                          healthPercent: Random().nextInt(10) / 10,
                        ),
                      )
                      .toList(),
                )
              : Center(
                  child: Text(Strings.emptyFavorite),
                ),
    );
  }
}
