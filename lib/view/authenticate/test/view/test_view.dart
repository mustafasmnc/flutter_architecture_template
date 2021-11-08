import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/base/state/base_state.dart';
import 'package:flutter_architecture_template/core/base/view/base_view.dart';
import 'package:flutter_architecture_template/core/constants/enums/locale_keys_enum.dart';
import 'package:flutter_architecture_template/core/extension/string_extension.dart';
import 'package:flutter_architecture_template/core/init/cache/locale_manager.dart';
import 'package:flutter_architecture_template/core/init/lang/language_manager.dart';
import 'package:flutter_architecture_template/core/init/lang/locale_keys.g.dart';
import 'package:flutter_architecture_template/view/authenticate/test/viewmodel/test_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  TestViewModel? viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (context, value) => scaffoldBody,
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: appBar(),
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber,
      );

  AppBar appBar() {
    return AppBar(
      leading:
          Text(LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)),
      title: textWelcomeWidget(),
      actions: [iconButtonChangeTheme()],
    );
  }

  Widget get textNumber {
    return Column(
      children: [
        Observer(builder: (context) => Text(viewModel!.number.toString())),
      ],
    );
  }

  Text textWelcomeWidget() => Text(LocaleKeys.welcome.locale);

  IconButton iconButtonChangeTheme() {
    return IconButton(
        onPressed: () {
          context.setLocale(LanguageManager.instance.enLocale);
        },
        icon: Icon(Icons.change_circle));
  }

  FloatingActionButton get floatingActionButtonNumberIncrement {
    return FloatingActionButton(
      onPressed: () => viewModel!.incrementNumber(),
    );
  }
}

extension _FormArea on _TestViewState {
  TextFormField get mailField =>
      TextFormField(validator: (value) => value!.isValidEmail);
}
