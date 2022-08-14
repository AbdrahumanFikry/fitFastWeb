import 'package:fit_fast_web/core/utilities/web_app_util.dart';
import 'package:fit_fast_web/features/cart/presentation/pages/cart_page.dart';
import 'package:fit_fast_web/features/daily_planner/presentation/pages/daily_planner_page.dart';
import 'package:fit_fast_web/features/planner/presentation/pages/planner_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/splash/presentation/pages/splash_page.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitFast',
      navigatorKey: navigatorKey,
      theme: WebAppUtil.themeData,
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: <String, WidgetBuilder>{
        SplashPage.routeName: (_) => const SplashPage(),
        DailyPlannerPage.routeName: (_) => const DailyPlannerPage(),
        PlannerPage.routeName: (_) => const PlannerPage(),
        CartPage.routeName: (_) => const CartPage(),
      },
    );
  }
}
