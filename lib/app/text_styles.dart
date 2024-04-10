import 'package:flutter/material.dart';
import 'colors.dart';
import 'fonts.dart';

TextStyle products(BuildContext context) {
  return TextStyle(
      fontFamily: Fonts.poppins,
      fontSize: MediaQuery.of(context).size.width >= 750 ? 14 : 10,
   color: Color(0xFF000000),

      fontWeight: FontWeight.w700);

}

TextStyle products2(BuildContext context) {
  return TextStyle(
    fontFamily: 'Poppins',
      fontSize: MediaQuery.of(context).size.width >= 750 ? 14 : 10,
  color: Color(0xFF696969));

}
TextStyle products3(BuildContext context) {
  return TextStyle(
      fontFamily: 'Poppins',
      fontSize: MediaQuery.of(context).size.width >= 800 ? 40 : 25,
      fontWeight: FontWeight.w700,
      color: Colors.white);

}


TextStyle products4(BuildContext context) {
  return TextStyle(
      fontFamily: 'Poppins',
      fontSize: MediaQuery.of(context).size.width >= 800 ? 12 : 10,
      fontWeight: FontWeight.w700,
      color: textTertiaryColor);
}

TextStyle products5(BuildContext context) {
  return TextStyle(
      fontFamily: 'Poppins',
      fontSize: MediaQuery.of(context).size.width >= 800 ? 15 : 15,
      fontWeight: FontWeight.w700,
      color: textTertiaryColor);

}

TextStyle products6(BuildContext context) {
  return TextStyle(
      fontFamily: 'Poppins',
      fontSize: MediaQuery.of(context).size.width >= 800 ? 20 : 25,
      fontWeight: FontWeight.w700,
      color: textTertiaryColor);

}

TextStyle products7(BuildContext context) {
  return TextStyle(
      fontFamily: 'Poppins',
      fontSize: MediaQuery.of(context).size.width >= 800 ? 18 : 15,
      fontWeight: FontWeight.w700,
      color: textTertiaryColor);

}

TextStyle h1(BuildContext context) {
  return TextStyle(
      fontFamily: Fonts.poppins,
      fontSize: MediaQuery.of(context).size.width >= 992 ? 56 : 28,
      color: textTertiaryColor,
      fontWeight: FontWeight.w700);
}

TextStyle h2(BuildContext context) {
  return TextStyle(
      fontFamily: Fonts.raleway,
      fontSize: MediaQuery.of(context).size.width >= 992 ? 22 : 18,
      color: textSecondaryColor,
      fontWeight: FontWeight.w400);
}

TextStyle a(BuildContext context) {
  return TextStyle(
      fontFamily: Fonts.raleway,
      fontSize: MediaQuery.of(context).size.width >= 992 ? 18 : 16,
      color: textPrimaryColor,
      fontWeight: FontWeight.bold);
}

class SectionTitle {
  static TextStyle h2(BuildContext context) {
    return const TextStyle(
        fontFamily: Fonts.raleway,
        fontSize: 32,
        color: textPrimaryColor,
        fontWeight: FontWeight.bold);
  }

  static TextStyle p(BuildContext context) {
    return const TextStyle(
      fontFamily: Fonts.openSans,
      fontSize: 14,
      color: Color(0xFF919191),
    );
  }
}

class AboutTextStyles {
  static TextStyle li(BuildContext context) {
    return const TextStyle(
      fontFamily: Fonts.openSans,
      fontSize: 14,
      color: Color(0xFF444444),
    );
  }
}
