part of '../pages/login_page.dart';

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        onTap: () {},
        child: Text(
          S.of(context).forgotPasswordQ,
          style: AppUtil.textStyle(
            context,
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: ColorUtil.blackColor,
          ),
        ),
      ),
    );
  }
}
