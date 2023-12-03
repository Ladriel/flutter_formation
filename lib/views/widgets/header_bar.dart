import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_formation/core/theme.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Provider.of<AppTheme>(context).theme;
    return AppBar(
      iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
      backgroundColor: theme.colorScheme.primary,
      title: Text(title, style: TextStyle(color: theme.colorScheme.onPrimary),),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}