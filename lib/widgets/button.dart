import 'package:flutter/material.dart';
import 'package:match_bet/utils/colors.dart';

class ButtonWidget extends StatefulWidget {
  final VoidCallback onTap;
  final String buttonText;
  const ButtonWidget(
      {super.key, required this.onTap, required this.buttonText});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
          decoration: ShapeDecoration(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              color: primaryColor),
          child: Text(
            widget.buttonText,
            style: TextStyle(
              color: whiteColor,
            ),
          )),
    );
  }
}
