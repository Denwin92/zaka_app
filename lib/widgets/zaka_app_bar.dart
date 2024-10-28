import 'package:flutter/material.dart';

class ZakaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const ZakaAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      automaticallyImplyLeading: true,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
