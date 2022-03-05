import 'package:flutter/material.dart';
import 'package:memorybox2/resources/resources.dart';


ThemeData theme() {
  return ThemeData(
    backgroundColor: AppColors.whiteColor,
    textTheme: const TextTheme(
      headline6: TextStyle(
        fontFamily: 'TTNorms-Bold',
        fontSize: 48,
        color: Colors.white,
      ),
      headline5: TextStyle(
        fontFamily: 'TTNorms-Medium',
        fontSize: 24,
        color: AppColors.textColor,
      ),
      headline4: TextStyle(
        fontFamily: 'TTNorms-Regular',
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      headline3: TextStyle(
        fontFamily: 'TTNorms-Medium',
        fontSize: 18,
        color: AppColors.textColor,
        fontWeight: FontWeight.w500,
      ),
      headline1: TextStyle(
        fontFamily: 'TTNorms-Medium',
        fontSize: 14,
        color: AppColors.textColor,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: TextStyle(
        fontFamily: 'TTNorms-Medium',
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      subtitle2: TextStyle(
        fontFamily: 'TTNorms-Medium',
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyText1: TextStyle(
        fontFamily: 'TTNorms-Regular',
        fontSize: 16,
        color: AppColors.textColor,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        fontFamily: 'TTNorms-Regular',
        fontSize: 14,
        color: AppColors.textColor,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
