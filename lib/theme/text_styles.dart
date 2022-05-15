
import 'package:flutter/material.dart';

abstract class AppTextStyles {

  // region Custom Styles
  static TextStyle mainHeader() {
    return AppTextStyles.mainText(fontSize: 30, fontWeight: FontWeight.w700);
  }
  // endregion

  // region General Customizable Styles
  static TextStyle mainText({
    double fontSize = 16,
    String fontFamily = 'Arial',
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
    );
  }
  // endregion

}