import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<T extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;

  final T viewModel;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;

  const BaseView(
      {Key? key,
      this.onModelReady,
      this.onDispose,
      required this.viewModel,
      required this.onPageBuilder})
      : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState<T extends Store> extends State<BaseView<T>> {
  late T model;
  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady!(model);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, widget.viewModel);
  }
}
