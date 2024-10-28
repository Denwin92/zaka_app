import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/text_formatter.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData iconData;
  final Function(String? value)? onSaved;
  final String? Function(String? value)? validator;
  final bool obscureText;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController? textEditingController;
  final bool isEnabled;
  final String? initialValue;

  const TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.iconData,
      this.onSaved,
      this.validator,
      this.obscureText = false,
      this.textInputType,
      this.textInputFormatter,
      this.textEditingController,
      this.isEnabled = true,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 30, top: 7.5, right: 30, bottom: 7.5),
      child: TextFormField(
        initialValue: initialValue,
        controller: textEditingController,
        obscureText: obscureText,
        onSaved: onSaved,
        enabled: isEnabled,
        validator: validator,
        keyboardType: textInputType,
        inputFormatters: textInputFormatter,
        decoration: InputDecoration(
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0)),
                borderSide: BorderSide(color: Colors.yellow, width: 2)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.black54)),
            fillColor: CupertinoColors.white,
            filled: true,
            prefixIcon: Icon(iconData)),
      ),
    );
  }
}
