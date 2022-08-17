import 'package:fit_fast_web/core/utilities/path_util.dart';
import 'package:fit_fast_web/core/utilities/web_app_util.dart';
import 'package:fit_fast_web/features/daily_planner/presentation/pages/daily_planner_page.dart';
import 'package:fit_fast_web/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'features/splash/presentation/pages/splash_page.dart';
import 'generated/l10n.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    prepareImages(context);
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
        LoginPage.routeName: (_) => const LoginPage(),
        DailyPlannerPage.routeName: (_) => const DailyPlannerPage(),
      },
    );
  }

  void prepareImages(BuildContext context) async {
    await precacheImage(
      const AssetImage(WebPathUtil.loginBackgroundPNG),
      context,
    );
  }
}
