import 'package:flutter_architecture_template/core/init/theme/light/color_scheme_light.dart';
import 'package:flutter_architecture_template/core/init/theme/light/padding_insets.dart';
import 'package:flutter_architecture_template/core/init/theme/light/text_theme_light.dart';

abstract class ILightTheme {
  TextThemeLight textThemeLight = TextThemeLight.instance;
  ColorSchemeLight colorSchemeLight = ColorSchemeLight.instance;
  PaddingInsets insets = PaddingInsets();
}
