import 'package:flutter/material.dart';

final backgroundColor = Color(hexColor('F5F5F5'));
final inputColor = Color(hexColor('ECECEC'));
final bottomBarColor = Color(hexColor('D9D9D9'));
final textColor = Color(hexColor('63625D'));
final blackColor = Color(hexColor('000000'));
final primaryColor = Color(hexColor('1328DE'));
final whiteColor = Color(hexColor('FFFFFF'));

int hexColor(String color) {
  String newColor = '0xff$color';
  int finalColor = int.parse(newColor);
  return finalColor;
}
