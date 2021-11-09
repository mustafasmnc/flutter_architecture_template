import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/base/view/base_view.dart';
import 'package:flutter_architecture_template/core/extension/context_extension.dart';
import 'package:flutter_architecture_template/view/authenticate/login/viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, LoginViewModel value) =>
          buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            Container(
              padding: context.paddingLow,
              height: context.height * 0.4,
              color: Theme.of(context).buttonTheme.colorScheme!.onPrimary,
              child: buildText(context),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.lowValue,
                    vertical: context.mediumValue))
          ],
        ),
      );

  Text buildText(BuildContext context) {
    return Text(
      "Hello World",
      style: Theme.of(context)
          .textTheme
          .headline1!
          .copyWith(color: context.theme.primaryColor),
    );
  }
}
