import 'package:flutter/material.dart';

class LoaderOverlay {
  static void show(BuildContext context, {bool isDismissible = false}) =>
      Navigator.push(
          context,
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (_, __, ___) => _LoaderOverlayContent(
              isDismissible: isDismissible,
            ),
          ));
}

class _LoaderOverlayContent extends StatelessWidget {
  final bool isDismissible;

  const _LoaderOverlayContent({required this.isDismissible});

  @override
  Widget build(BuildContext context) => PopScope(
    onPopInvoked: (_){
      if(isDismissible){
        Navigator.pop(context);
      }
    },
    child: GestureDetector(
      onTap: () => isDismissible ? Navigator.pop(context) : null,
      child: Container(
        color: Colors.black87.withOpacity(0.9),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.yellow,
          ),
        ),
      ),
    ),
  );
}
