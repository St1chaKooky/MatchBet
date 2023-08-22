import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ButtonGoogleWidget extends StatefulWidget {
  const ButtonGoogleWidget({super.key});

  @override
  State<ButtonGoogleWidget> createState() => _ButtonGoogleWidgetState();
}

class _ButtonGoogleWidgetState extends State<ButtonGoogleWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(6),
                ),
                side: BorderSide(color: bottomBarColor, width: 2),
              ),
              color: whiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/googleLogo.png',
                width: 17,
                height: 17,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Continue with Google',
                style: TextStyle(
                  // fontFamily: 'WorkSans',
                  color: textColor,
                ),
              ),
            ],
          )),
    );
  }
}
