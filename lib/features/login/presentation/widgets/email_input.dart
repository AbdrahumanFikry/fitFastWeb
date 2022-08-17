part of '../pages/login_page.dart';

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) => AppTextField(
        hintText: S.of(context).email,
        hintColor: ColorUtil.greyColor,
        fillColor: ColorUtil.lightGreyColor,
        readOnly: state.loading,
        onChanged: (value) => context.read<LoginCubit>().changeEmail(value),
      ),
    );
  }
}
