import 'package:flutter/material.dart';


class Toasties {
  static void success(BuildContext context, String toastiesText) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        toastiesText,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.yellow,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.yellow, width: 1),
          borderRadius: BorderRadius.circular(15)),
      behavior: SnackBarBehavior.floating,
    ));
  }

  static void failed(BuildContext context, String toastiesText) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        toastiesText,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.redAccent,
      duration: const Duration(seconds: 3),
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.redAccent, width: 1),
          borderRadius: BorderRadius.circular(15)),
      behavior: SnackBarBehavior.floating,
    ));
  }
}