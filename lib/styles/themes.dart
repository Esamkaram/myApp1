import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myapp2/styles/colors.dart';

ThemeData darkThemes = ThemeData(
   scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch: defaultColors,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    iconTheme: IconThemeData(
        color: Colors.white
    ),
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah' ,
      color: Colors.white,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //   backgroundColor: defaultColors,
  // ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColors,
    unselectedItemColor: Colors.grey,
    elevation: 50.0,
    backgroundColor: HexColor('333739'),

  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Jannah' ,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color:Colors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontFamily: 'Jannah' ,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      height: 1.4,
    ),
  ),
  fontFamily: 'Jannah' ,
) ;
ThemeData lightThemes = ThemeData(
  primarySwatch: defaultColors ,
   scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backgroundColor: Colors.white,
    elevation: 0.0,
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah' ,
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
       statusBarColor: Colors.red,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //   backgroundColor: defaultColors,
  // ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColors,
    unselectedItemColor: Colors.grey,
    elevation: 50.0,
    backgroundColor: Colors.white,

  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontFamily: 'Jannah' ,
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color:Colors.black,
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      fontFamily: 'Jannah' ,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1.4,
    ),
  ),
   fontFamily: 'Jannah' ,
) ;