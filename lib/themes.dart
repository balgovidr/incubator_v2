import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    //1
    return ThemeData(
        //2
        primaryColor: const Color(0xFF333333),
        scaffoldBackgroundColor: Colors.white, //3
        buttonTheme: ButtonThemeData(
          // 4
          buttonColor: const Color(0xFF455a64),
          hoverColor: const Color(0xFF3d4f58),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 30,
              fontWeight: FontWeight.w300),
          headline2: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 20,
              fontWeight: FontWeight.w300),
          headline3: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              fontWeight: FontWeight.w300),
          bodyText1: TextStyle(fontFamily: 'Helvetica'),
        ));
  }
}
