part of '../pages/login_page.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onTap: () {},
      backgroundColor: ColorUtil.accentColor,
      fontSize: 16.0,
      elevation: 0.0,
      borderRadius: AppUtil.borderRadius20,
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      title: S.of(context).signIn,
      context: context,
    );
  }
}
