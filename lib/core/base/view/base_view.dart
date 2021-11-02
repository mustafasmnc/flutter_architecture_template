import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T value)? onPageBuilder;

  final T? viewModel;
  final Function(T model)? onModelReady;
  final VoidCallback? onDispose;

  const BaseView(
      {Key? key,
      this.viewModel,
      this.onModelReady,
      this.onDispose,
      this.onPageBuilder})
      : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.onModelReady != null) widget.onModelReady!(widget.onModelReady);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder!(context, widget.viewModel);
  }
}
