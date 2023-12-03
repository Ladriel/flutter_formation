import 'package:flutter/cupertino.dart';

class FavoritesScreen extends StatelessWidget {
  final List<String> favorites;
  const FavoritesScreen({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
        favorites.map((fav) => Text(fav),).toList(),
    );
  }
}
