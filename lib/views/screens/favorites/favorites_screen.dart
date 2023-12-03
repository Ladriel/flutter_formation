import 'package:flutter/cupertino.dart';
import 'package:flutter_formation/state/favorites_state.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // could use Provider.of
    return Consumer<FavoritesState>(
      builder: (context, favoritesState, _) => Column(
        children: favoritesState.favorites
            .map(
              (fav) => Text(fav),
            )
            .toList(),
      ),
    );
  }
}
