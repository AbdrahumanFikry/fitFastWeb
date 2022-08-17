part of '../pages/login_page.dart';

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      hintText: S.of(context).email,
      hintColor: ColorUtil.greyColor,
      fillColor: ColorUtil.lightGreyColor,
    );
  }
}
