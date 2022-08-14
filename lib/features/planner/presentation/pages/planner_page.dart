import 'package:fit_fast_core/fit_fast_core.dart';
import 'package:fit_fast_web/features/cart/presentation/pages/cart_page.dart';
import 'package:fit_fast_web/features/planner/presentation/blocs/planner_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/widgets/app_drop_down_menu.dart';
import '../../../../core/widgets/search_card.dart';

part '../widgets/planner_top_bar.dart';

part '../widgets/contact_widget.dart';

part '../widgets/profile_widget.dart';

part '../widgets/cart_widget.dart';

part '../widgets/planner_switcher.dart';

part '../widgets/planner_footer.dart';

part '../widgets/products_widget.dart';

part '../widgets/products_cart_widget.dart';

class PlannerPage extends StatelessWidget {
  const PlannerPage({Key? key}) : super(key: key);

  static const String routeName = "/planner";

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const PlannerPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlannerBloc>(
      create: (_) => PlannerBloc(),
      child: BlocListener<PlannerBloc, PlannerState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) async {},
        child: const _PlannerWidgets(),
      ),
    );
  }
}

class _PlannerWidgets extends StatelessWidget {
  const _PlannerWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            _PlannerTopBar(),
            _PlannerSwitcher(),
            Expanded(child: _ProductsCartWidget()),
            _PlannerFooter(),
          ],
        ),
      ),
    );
  }
}
