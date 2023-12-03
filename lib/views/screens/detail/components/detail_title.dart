import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_formation/core/theme.dart';

class DetailTitle extends StatelessWidget {
  final int id;
  final String name;

  const DetailTitle({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Provider.of<AppTheme>(context).theme;
    return Chip(
      backgroundColor: theme.colorScheme.secondary,
      label: Text(
        "${name[0].toUpperCase()}${name.substring(1)}",
        style: TextStyle(
          fontSize: 24,
          color: theme.colorScheme.onSecondary,
        ),
      ),
      avatar: CircleAvatar(
        child: Text(
          id.toString(),
        ),
      ),
    );
  }
}
