import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/components/card/not_found_navigation_widget.dart';
import 'package:flutter_architecture_template/core/constants/navigation/navigation_constans.dart';
import 'package:flutter_architecture_template/view/authenticate/test/view/test_view.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> onGenerateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.TEST_VIEW:
        return normalNavigate(TestView());
      default:
        return MaterialPageRoute(
            builder: (context) => NotFoundNavigationWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
