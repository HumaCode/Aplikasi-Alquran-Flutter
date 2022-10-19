import 'package:alquran/app/constants/constants.dart';
import 'package:alquran/app/constants/r.dart';
import 'package:flutter/material.dart';

// tema light
ThemeData appLight = ThemeData(
  scaffoldBackgroundColor: R.colors.secondary,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: R.colors.primary,
  ),
  primaryColor: R.colors.primary,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    backgroundColor: R.colors.primary,
    elevation: 0,
    titleTextStyle: bold.copyWith(
      fontSize: 25,
    ),
  ),
  listTileTheme: ListTileThemeData(
    iconColor: R.colors.primary,
  ),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: R.colors.primary,
        ),
      ),
    ),
    unselectedLabelColor: R.colors.grey,
    labelColor: R.colors.primary,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
);

// tema Dark
ThemeData appDark = ThemeData(
  scaffoldBackgroundColor: R.colors.purple900,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: R.colors.purple,
  ),
  primaryColor: R.colors.purple700,
  brightness: Brightness.dark,
  appBarTheme: AppBarTheme(
    backgroundColor: R.colors.purple900,
    elevation: 0,
    titleTextStyle: bold.copyWith(
      fontSize: 25,
    ),
  ),
  listTileTheme: ListTileThemeData(
    iconColor: R.colors.wheat2,
  ),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      border: Border(
          bottom: BorderSide(
        color: R.colors.wheat,
      )),
    ),
    unselectedLabelColor: R.colors.grey,
    labelColor: R.colors.wheat,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
);
