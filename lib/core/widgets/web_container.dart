import 'package:fit_fast_core/fit_fast_core.dart';
import 'package:flutter/material.dart';

class WebContainer extends StatelessWidget {
  final Widget child;

  const WebContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final needOverallPadding = context.screenWidth >= 1500;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: needOverallPadding ? 0.0 : 20.0,
        ),
        child: SizedBox(
          width: needOverallPadding ? 1400 : context.screenWidth,
          child: child,
        ),
      ),
    );
  }
}
