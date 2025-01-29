import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_formation/core/theme.dart';

class DetailTitle extends StatelessWidget {
  final String name;

  const DetailTitle({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "${name[0].toUpperCase()}${name.substring(1)}",
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    );
  }
}
