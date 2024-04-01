import 'package:e_comm_app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:e_comm_app/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:e_comm_app/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:e_comm_app/utils/theme/custom_themes/chip_theme.dart';
import 'package:e_comm_app/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:e_comm_app/utils/theme/custom_themes/outlined_button_them.dart';
import 'package:e_comm_app/utils/theme/custom_themes/text_theme.dart';
import 'package:e_comm_app/utils/theme/custom_themes/textfied_them.dart';
import 'package:flutter/material.dart';

class ECTheme {
  ECTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: ECTextTheme.lightTextTheme,
      chipTheme: ECChipTheme.lightChipTheme,
      appBarTheme: ECAppBarTheme.lightAppbarTheme,
      checkboxTheme: ECCheckBoxTheme.lightCheckBoxTheme,
      bottomSheetTheme: ECBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: ECElevatedButtonTheme.lightElevatedButtonTheme,
      inputDecorationTheme: ECTextFieldTheme.lightInputDecorationTheme,
      outlinedButtonTheme: ECOutlinedButtonTheme.lightOutlinedButtonTheme);
      
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: ECTextTheme.darkTextTheme,
      chipTheme: ECChipTheme.dakChipTheme,
      appBarTheme: ECAppBarTheme.darkAppbarTheme,
      checkboxTheme: ECCheckBoxTheme.darkCheckBoxTheme,
      bottomSheetTheme: ECBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: ECElevatedButtonTheme.darkElevatedButtonTheme,
      inputDecorationTheme: ECTextFieldTheme.darkInputDecorationTheme,
      outlinedButtonTheme: ECOutlinedButtonTheme.darkOutlinedButtonTheme);
}
