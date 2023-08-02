import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_recipe_app/app/core/colors.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    primaryColor: AppColors().lilyColor1,
    scaffoldBackgroundColor: AppColors().whiteColor,
    cardTheme: CardTheme(
      color: AppColors().greyColor,
      surfaceTintColor: AppColors().lilyColor.withOpacity(.1),
      shadowColor: AppColors().lilyColor.withOpacity(.1),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors().whiteColor,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors().lilyColor1),
      backgroundColor: AppColors().whiteColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      toolbarTextStyle: TextTheme(displayLarge: TextStyle(color: AppColors().blackColor)).displayLarge,
      titleTextStyle: TextTheme(displayLarge: TextStyle(color: AppColors().blackColor)).displayLarge,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors().blackColor.withOpacity(.6),
      onSecondary: AppColors().lilyColor1,
      background: AppColors().blackColor,
      onPrimary: AppColors().greyColor.withOpacity(.5),
      onBackground: AppColors().whiteColor,
      primary: AppColors().lilyColor1.withOpacity(.1),
      onPrimaryContainer: AppColors().lilyColor1,
      inversePrimary: AppColors().blackColor,
      onSurface: AppColors().brownColor1,
      surfaceVariant: Colors.transparent,
    ),
  );
  final darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    primaryColor: AppColors().lilyColor1,
    scaffoldBackgroundColor: const Color.fromARGB(255, 8, 1, 34),
    cardTheme: CardTheme(
      color: const Color.fromARGB(255, 56, 14, 50).withOpacity(.8),
      surfaceTintColor: const Color.fromARGB(255, 56, 14, 50).withOpacity(.5),
      shadowColor: const Color.fromARGB(255, 56, 14, 50).withOpacity(.1),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 8, 1, 34),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: AppColors().whiteColor),
      backgroundColor: const Color.fromARGB(255, 8, 1, 34),
      systemOverlayStyle: SystemUiOverlayStyle.light,
      toolbarTextStyle: TextTheme(displayLarge: TextStyle(color: AppColors().whiteColor)).displayLarge,
      titleTextStyle: TextTheme(displayLarge: TextStyle(color: AppColors().whiteColor)).displayLarge,
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColors().whiteColor,
      onSecondary: AppColors().whiteColor,
      background: AppColors().whiteColor,
      onPrimary: AppColors().lilyColor1.withOpacity(.3),
      onBackground: AppColors().lilyColor1.withOpacity(.3),
      primary: AppColors().lilyColor1,
      onPrimaryContainer: AppColors().whiteColor,
      inversePrimary: AppColors().greyColor.withOpacity(.4),
      onSurface: AppColors().whiteColor,
      surfaceVariant: Colors.transparent,
    ),
  );
}
