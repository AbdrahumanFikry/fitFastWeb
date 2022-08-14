import 'package:fit_fast_core/fit_fast_core.dart';
import 'package:fit_fast_web/core/utilities/path_util.dart';
import 'package:fit_fast_web/core/widgets/web_container.dart';
import 'package:fit_fast_web/features/daily_planner/presentation/bloc/daily_planner_bloc.dart';
import 'package:fit_fast_web/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

part '../widgets/daily_planner_top_bar.dart';

part '../widgets/contact_widget.dart';

part '../widgets/profile_component.dart';

part '../widgets/kitchen.dart';

part '../widgets/plan_category_picker.dart';

part '../widgets/plan_levels.dart';

part '../widgets/meal_categories.dart';

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
    return BlocProvider<DailyPlannerBloc>(
      create: (_) => DailyPlannerBloc(),
      child: BlocListener<DailyPlannerBloc, DailyPlannerState>(
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
        backgroundColor: ColorUtil.lightGreyColor,
        body: Column(
          children: [
            const _DailyPlannerTopBar(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.isMobile ? 24.0 : 45.0,
              ),
              child: Text(
                S.of(context).dailyPlanner,
                style: AppUtil.textStyle(
                  context,
                  fontWeight: FontWeight.w500,
                  color: ColorUtil.blackColor,
                  fontSize: 28.0,
                ),
              ),
            ),
            const Expanded(child: _Kitchen()),
          ],
        ),
      ),
    );
  }
}