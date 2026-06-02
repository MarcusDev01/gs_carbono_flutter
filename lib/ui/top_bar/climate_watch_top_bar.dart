import 'package:flutter/material.dart';

class ClimateWatchTopBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const ClimateWatchTopBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}