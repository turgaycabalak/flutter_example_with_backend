import 'package:flutter/material.dart';
import 'background_color.dart';

class MyTheme {
  InputDecoration myInputDecoration(
      {String? hintText, required IconData iconData}) {
    return InputDecoration(

      hintText: hintText ?? "",
      border: InputBorder.none,
      prefixIcon: Icon(
        iconData,
        color: MyBackGroundColor("5BA7FB"),
      ),
      // suffixIcon: Icon(Icons.person_outline),
    );
  }

  BoxDecoration myInputBoxDecoration() {
    return BoxDecoration(
      color: MyBackGroundColor("333443"),
      borderRadius: BorderRadius.circular(20),
    );
  }
}
