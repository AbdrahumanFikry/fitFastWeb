part of '../pages/login_page.dart';

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: S.of(context).password,
      hintColor: ColorUtil.greyColor,
      fillColor: ColorUtil.lightGreyColor,
      isPassword: true,
      hidePassword: true,
    );
  }
}
