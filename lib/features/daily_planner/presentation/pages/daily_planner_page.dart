import 'package:fit_fast_core/fit_fast_core.dart';
import 'package:fit_fast_web/core/utilities/path_util.dart';
import 'package:fit_fast_web/core/widgets/web_container.dart';
import 'package:fit_fast_web/features/planner/presentation/blocs/planner_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part '../widgets/daily_planner_top_bar.dart';

part '../widgets/contact_widget.dart';

part '../widgets/profile_component.dart';

class DailyPlannerPage extends StatelessWidget {
  const DailyPlannerPage({Key? key}) : super(key: key);

  static const String routeName = "/daily_planner";

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const DailyPlannerPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlannerBloc>(
      create: (_) => PlannerBloc(),
      child: BlocListener<PlannerBloc, PlannerState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) async {},
        child: const _DailyPlannerWidgets(),
      ),
    );
  }
}

class _DailyPlannerWidgets extends StatelessWidget {
  const _DailyPlannerWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            _DailyPlannerTopBar(),
          ],
        ),
      ),
    );
  }
}
