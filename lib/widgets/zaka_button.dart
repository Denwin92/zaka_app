import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZakaButton extends StatelessWidget {
  final String buttonText;
  final Function onPressed;
  final double minWidth;
  final bool isEnabled;

  const ZakaButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.minWidth = 300,
      this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      // minWidth: minWidth,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all<Color>(CupertinoColors.white),
        foregroundColor: MaterialStateProperty.all<Color>(
          isEnabled ? Colors.black : Colors.grey,
        ),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
