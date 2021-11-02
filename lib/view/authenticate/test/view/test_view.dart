import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/core/base/state/base_state.dart';
import 'package:flutter_architecture_template/core/base/view/base_view.dart';
import 'package:flutter_architecture_template/view/authenticate/test/viewmodel/test_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

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
        viewModel = model;
      },
      onPageBuilder: (context, value) => Text("data"),
    );
  }

  Widget get scaffoldBody => Scaffold(
        floatingActionButton: floatingActionButtonNumberIncrement,
        body: textNumber,
      );

  FloatingActionButton get floatingActionButtonNumberIncrement {
    return FloatingActionButton(
      onPressed: () => viewModel!.incrementNumber(),
    );
  }

  Widget get textNumber {
    return Observer(builder: (context) => Text(viewModel!.number.toString()));
  }
}
