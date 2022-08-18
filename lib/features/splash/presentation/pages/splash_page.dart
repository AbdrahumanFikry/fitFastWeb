import 'package:fit_fast_web/core/utilities/path_util.dart';
import 'package:fit_fast_web/features/daily_planner/presentation/pages/daily_planner_page.dart';
import 'package:fit_fast_web/features/login/presentation/pages/login_page.dart';
import 'package:fit_fast_web/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const String routeName = "/splash";

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SplashPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..initFunction(),
      child: BlocListener<SplashCubit, SplashState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state is SplashFinished) {
            Navigator.pushNamed(context, DailyPlannerPage.routeName);
          }
        },
        child: const _SplashWidgets(),
      ),
    );
  }
}

class _SplashWidgets extends StatelessWidget {
  const _SplashWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          WebPathUtil.appLogo,
          width: 216.0,
          height: 36.0,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
