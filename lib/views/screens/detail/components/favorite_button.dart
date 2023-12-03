import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final Function callBack;
  const FavoriteButton(
      {Key? key, required this.callBack, required this.isFavorite})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Builder(builder: (context) {
      return IconButton(
        iconSize: 35,
        onPressed: () {
          callBack();
        },
        icon: isFavorite
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border_outlined),
        color: theme.primaryColor,
      );
    });
  }
}