import 'package:flutter/material.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.colorScheme.primary,
      title: Text(title, style: TextStyle(color: theme.colorScheme.onPrimary),),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}