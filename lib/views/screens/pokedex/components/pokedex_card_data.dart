import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_formation/core/theme.dart';

class PokedexCardData extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String id;

  const PokedexCardData({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Positioned(
            top: 1,
            left: 1,
            child: CircleAvatar(
              maxRadius: 20,
              child: Text(id),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
                frameBuilder: (BuildContext context, Widget child, int? frame,
                    bool wasSynchronouslyLoaded) {
                  return frame != null
                      ? child
                      : Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            'assets/pokeball.png',
                            fit: BoxFit.contain,
                          ),
                        );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 1,
            right: 1,
            child: Text(
              "${name[0].toUpperCase()}${name.substring(1)}",
              style: TextStyle(
                fontSize: 15,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
