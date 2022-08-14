import 'package:fit_fast_core/fit_fast_core.dart';
import 'package:flutter/material.dart';

class WebContainer extends StatelessWidget {
  final Widget child;

  const WebContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: context.screenWidth >= 1400 ? 1300 : context.screenWidth,
        child: child,
      ),
    );
  }
}
