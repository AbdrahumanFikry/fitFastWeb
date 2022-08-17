part of '../pages/login_page.dart';

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => AppTextField(
        hintText: S.of(context).password,
        hintColor: ColorUtil.greyColor,
        fillColor: ColorUtil.lightGreyColor,
        isPassword: true,
        hidePassword: state.hidePassword,
        changeObscuring: loginCubit.changePasswordObscuring,
        readOnly: state.loading,
        onChanged: (value) => loginCubit.changePassword(value),
      ),
    );
  }
}
