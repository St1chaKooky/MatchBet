import 'package:flutter/material.dart';

class ButtonLitleWidget extends StatefulWidget {
  final VoidCallback onTap;
  final String buttonText;
  final Color colorFill;
  final Color colorText;
  final double width;
  final bool bigButton;

  const ButtonLitleWidget(
      {super.key,
      required this.onTap,
      this.width = 110,
      this.bigButton = false,
      required this.buttonText,
      required this.colorFill,
      required this.colorText});

  @override
  State<ButtonLitleWidget> createState() => _ButtonLitleWidgetState();
}

class _ButtonLitleWidgetState extends State<ButtonLitleWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
          width: widget.width,
          alignment: Alignment.center,
          padding: widget.bigButton
              ? const EdgeInsets.symmetric(
                  vertical: 14,
                )
              : const EdgeInsets.symmetric(
                  vertical: 10,
                ),
          decoration: ShapeDecoration(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              color: widget.colorFill),
          child: Text(
            widget.buttonText,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: widget.colorText,
            ),
          )),
    );
  }
}
