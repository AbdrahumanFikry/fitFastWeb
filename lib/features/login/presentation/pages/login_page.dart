import 'package:fit_fast_core/fit_fast_core.dart';
import 'package:fit_fast_web/core/widgets/app_text_field.dart';
import 'package:fit_fast_web/features/daily_planner/presentation/pages/daily_planner_page.dart';
import 'package:fit_fast_web/features/login/presentation/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utilities/path_util.dart';
import '../../../../core/widgets/contact_links.dart';
import '../../../../core/widgets/web_constraints.dart';
import '../../../../generated/l10n.dart';

part '../widgets/login_top_bar.dart';

part '../widgets/login_body.dart';

part '../widgets/email_input.dart';

part '../widgets/password_input.dart';

part '../widgets/forgot_password_button.dart';

part '../widgets/login_button.dart';

part '../widgets/error_pop_up.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = "/login";

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const LoginPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (_) => LoginCubit(),
      child: BlocListener<LoginCubit, LoginState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) async {},
        child: const _LoginWidgets(),
      ),
    );
  }
}

class _LoginWidgets extends StatelessWidget {
  const _LoginWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorUtil.lightGreyColor,
        body: SingleChildScrollView(
          child: Column(
            children: const [
              _LoginTopBar(),
              _LoginBody(),
            ],
          ),
        ),
      ),
    );
  }
}
