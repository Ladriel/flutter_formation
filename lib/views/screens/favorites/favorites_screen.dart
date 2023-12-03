import 'package:flutter/cupertino.dart';
import 'package:flutter_formation/state/favorites_state.dart';
import 'package:provider/provider.dart';
import 'components/favorite_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // could use Provider.of
    return Consumer<FavoritesState>(
      builder: (context, favoritesState, _) => ListView(
        shrinkWrap: true,
        children: favoritesState.favorites
            .map(
              (fav) => FavoriteCard(entry: fav),
            )
            .toList(),
      ),
    );
  }
}
