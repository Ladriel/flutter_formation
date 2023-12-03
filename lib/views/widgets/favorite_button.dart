import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final Function callBack;
  const FavoriteButton(
      {Key? key, required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          callBack();
        },
        icon: Icon(Icons.favorite),
        color: theme.primaryColor,
      );
    });
  }
}