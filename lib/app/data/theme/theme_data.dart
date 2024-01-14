import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/color_utils.dart';

class Themes {
  //! LIGHT THEME DATA
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: WHITE,
    backgroundColor: WHITE,
    primaryColor: APP_MAIN_RED,
    primaryColorLight: APP_MAIN_RED,
    splashColor: WHITE,
    disabledColor: Colors.grey[500],
    highlightColor: WHITE,
    hintColor: Colors.black,
    //
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),

    snackBarTheme: const SnackBarThemeData(
        backgroundColor: APP_DARK_GREY,
        elevation: 4,
        contentTextStyle: TextStyle(
            fontFamily: 'Rubik',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20)),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: APP_DARK_GREY,
        // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        // side: const BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: APP_MAIN_RED, elevation: 4),

    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: WHITE, statusBarIconBrightness: Brightness.dark),
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontFamily: 'Rubik',
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20),
      backgroundColor: Colors.transparent, //mainLIGHTAPPBARcolor,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    dividerTheme: const DividerThemeData(thickness: 2, color: INPUT_FIELD_GREY),
    chipTheme: ChipThemeData(
        backgroundColor: Colors.grey.shade500,
        disabledColor: Colors.grey.shade700,
        selectedColor: APP_MAIN_RED,
        secondarySelectedColor: WHITE,
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        brightness: Brightness.light,
        labelStyle: const TextStyle(
          fontFamily: 'Rubik',
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
        secondaryLabelStyle:
            const TextStyle(fontFamily: 'Rubik', fontWeight: FontWeight.w500),
        elevation: 4),

// ! input decoration
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      labelStyle: TextStyle(
          color: TEXT_HEADING, fontWeight: FontWeight.bold, fontSize: 20),
      errorMaxLines: 3,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.red,
        ),
      ),
      errorStyle: TextStyle(
          fontWeight: FontWeight.w200,
          fontFamily: 'Rubik',
          color: Colors.red,
          fontSize: 12),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: WHITE,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: WHITE,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        // borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          width: 1,
          color: WHITE,
        ),
      ),
    ),

    // textTheme: TextTheme(
    //   headline1: const TextStyle().copyWith(
    //       fontWeight: FontWeight.bold,
    //       fontSize: 28,
    //       color: BLACK,
    //       fontFamily: 'Rubik'),
    //   headline2: const TextStyle().copyWith(
    //       color: BLACK,
    //       // fontWeight: FontWeight.bold,
    //       fontFamily: 'Rubik',
    //       fontSize: 24),
    //   headline3: const TextStyle().copyWith(
    //       fontFamily: 'Rubik',
    //       color: BLACK,
    //       // fontWeight: FontWeight.bold,
    //       fontSize: 20),
    //   headline4: const TextStyle().copyWith(
    //       color: BLACK,
    //       // fontWeight: FontWeight.bold,
    //       fontFamily: 'Rubik',
    //       fontSize: 14),
    //   caption: const TextStyle().copyWith(color: BLACK, fontSize: 12),
    // ).apply(
    //   bodyColor: BLACK,
    //   fontFamily: 'Rubik',
    // ),
  );
}
