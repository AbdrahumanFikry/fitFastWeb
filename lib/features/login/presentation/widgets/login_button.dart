part of '../pages/login_page.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  Future<void> login(BuildContext context) async {
    try {
      await context.read<LoginCubit>().login();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => AppButton(
        onTap: state.password.isEmpty || state.password.isEmpty
            ? null
            : () => login(context),
        backgroundColor: ColorUtil.accentColor,
        fontSize: 16.0,
        elevation: 0.0,
        borderRadius: AppUtil.borderRadius20,
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        title: S.of(context).signIn,
        context: context,
        isBusy: state.loading,
      ),
    );
  }
}
