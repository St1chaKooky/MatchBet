import 'package:flutter/material.dart';

import '../utils/colors.dart';

class TextFieldInput extends StatelessWidget {
  // final TextEditingController textEditingController;
  final bool isPassword;
  final String hintText;
  final TextInputType textInputType;
  final Color color;

  const TextFieldInput({
    super.key,
    // required this.textEditingController,
    this.isPassword = false,
    required this.hintText,
    required this.textInputType,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      // controller: textEditingController,
      decoration: InputDecoration(
        fillColor: color,
        hintText: hintText,
        hintStyle: TextStyle(color: textColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Закругление границы
          borderSide:
              BorderSide.none, // Убираем границу, оставляя только закругления
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(8.0), // Закругление границы при фокусе
          borderSide:
              BorderSide.none, // Убираем границу, оставляя только закругления
        ),
        filled: true,
        contentPadding: const EdgeInsets.all(12),
      ),
      keyboardType: textInputType,
      obscureText: isPassword,
    );
  }
}
