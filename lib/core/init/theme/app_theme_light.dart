import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/constants/app/app_constants.dart';
import 'package:flutter_architecture_template/core/init/theme/app_theme.dart';
import 'package:flutter_architecture_template/core/init/theme/light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    if (_instance == null) _instance = AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  //ThemeData get theme => redTheme;
  ThemeData get theme => ThemeData(
        textTheme: textTheme(),
        fontFamily: ApplicationConstants.FONT_FAMILY,
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(),
        tabBarTheme: tabbarTheme(),
      );

  TabBarTheme tabbarTheme() {
    return TabBarTheme(
        labelPadding: insets.lowPaddingAll,
        unselectedLabelStyle:
            textThemeLight.headline4.copyWith(color: colorSchemeLight.red));
  }

  TextTheme textTheme() {
    return TextTheme(
      headline1: textThemeLight.headline1,
      headline2: textThemeLight.headline2,
      overline: textThemeLight.overline,
    );
  }
}
