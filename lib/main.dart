import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/constants/app/app_constants.dart';
import 'package:flutter_architecture_template/core/init/cache/locale_manager.dart';
import 'package:flutter_architecture_template/core/init/lang/language_manager.dart';
import 'package:flutter_architecture_template/core/init/navigation/navigation_route.dart';
import 'package:flutter_architecture_template/core/init/navigation/navigation_service.dart';
import 'package:flutter_architecture_template/core/init/notifier/provider_list.dart';
import 'package:flutter_architecture_template/core/init/notifier/theme_notifier.dart';
import 'package:flutter_architecture_template/view/authenticate/test/view/test_view.dart';
import 'package:provider/provider.dart';

void main() {
  LocaleManager.preferencesInit();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
        child: MyApp(),
        supportedLocales: LanguageManager.instance.supportedLocales,
        path: ApplicationConstants.LANG_ASSET_PATH),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: TestView(),
      onGenerateRoute: NavigationRoute.instance.onGenerateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
