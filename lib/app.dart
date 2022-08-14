import 'package:fit_fast_core/fit_fast_core.dart';
import 'package:fit_fast_web/features/cart/presentation/pages/cart_page.dart';
import 'package:fit_fast_web/features/planner/presentation/pages/planner_page.dart';
import 'package:flutter/material.dart';

import 'features/splash/presentation/pages/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitFast',
      navigatorKey: navigatorKey,
      theme: AppUtil.themeData,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      builder: (context, child) => Center(
        child: SizedBox(
          width: context.isWebOrDesktop ? 1500.0 : null,
          child: child!,
        ),
      ),
      routes: <String, WidgetBuilder>{
        SplashPage.routeName: (_) => const SplashPage(),
        PlannerPage.routeName: (_) => const PlannerPage(),
        CartPage.routeName: (_) => const CartPage(),
      },
    );
  }
}
