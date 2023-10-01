import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static Color primaryLight = Color(0xff5D9CEC);
  static Color backgroundColor = Color(0xffDFECDB);
  static Color whiteColor = Color(0xffFFFFFF);
  static Color greenColor = Color(0xff61E757);
  static Color redColor = Color(0xffEC4B4B);
  static Color greyColor = Color(0xff8888a6);
  static Color blackColor = Color(0xff060E1E);

  static ThemeData lightThem = ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          backgroundColor: primaryLight,
          shape: StadiumBorder(side: BorderSide(color: whiteColor, width: 6))),
      appBarTheme: AppBarTheme(
          backgroundColor: primaryLight,
          elevation: 0,
          iconTheme: IconThemeData(
            color: whiteColor,
          )),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryLight,
        unselectedItemColor: greyColor,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: whiteColor,
      primaryColor: primaryLight,
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22, color: whiteColor),
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: blackColor,
        ),
        titleSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: blackColor,
        ),
        bodySmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: whiteColor,
        ),
      ));
}
