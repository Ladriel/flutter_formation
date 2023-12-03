import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_formation/core/theme.dart';

class PokedexCardData extends StatelessWidget {
  final String imageUrl;
  final String name;

  const PokedexCardData({
    Key? key,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Provider.of<AppTheme>(context).theme;

    return Column(
      children: [
        Expanded(
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ),
        Divider(color: theme.colorScheme.primary),
        Text(
          "${name[0].toUpperCase()}${name.substring(1)}",
          style: TextStyle(
            fontSize: 21,
            color: theme.colorScheme.onBackground,
          ),
        ),
      ],
    );
  }
}
