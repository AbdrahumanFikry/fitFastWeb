import 'package:fit_fast_core/fit_fast_core.dart';
import 'package:fit_fast_web/features/cart/presentation/pages/cart_page.dart';
import 'package:fit_fast_web/features/daily_planner/presentation/pages/daily_planner_page.dart';
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
      routes: <String, WidgetBuilder>{
        SplashPage.routeName: (_) => const SplashPage(),
        DailyPlannerPage.routeName: (_) => const DailyPlannerPage(),
        PlannerPage.routeName: (_) => const PlannerPage(),
        CartPage.routeName: (_) => const CartPage(),
      },
    );
  }
}
