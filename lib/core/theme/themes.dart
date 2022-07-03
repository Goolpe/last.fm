import 'package:appsfactory_test/core/core.dart';
import 'package:flutter/material.dart';

class AFThemes{
  static final light = ThemeData.dark().copyWith(
    primaryColor: AFColors.primary,
    appBarTheme: const AppBarTheme(
      elevation: 0,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
      enabledBorder: OutlineInputBorder(      
        borderSide: BorderSide(color: AFColors.primary),   
      ),  
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AFColors.primary),
      ),  
    ),
  );
}
