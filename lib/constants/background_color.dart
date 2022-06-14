import 'package:flutter/material.dart';

const String backGroundColor = "3E4050";
const String textColor = "7F8C99";

class MyBackGroundColor extends Color {
  static int _convert(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  MyBackGroundColor(final String colorCode) : super(_convert(colorCode));
}

SnackBar buildSnackBar(BuildContext context, String message) {
  return SnackBar(
    content: Text(
      message,
      style:
          Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.white),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Colors.red,
  );
}
