part of '../pages/login_page.dart';

class _LoginBody extends StatelessWidget {
  const _LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight - 85.0,
      decoration: const BoxDecoration(
        color: ColorUtil.whiteScaffold,
        image: DecorationImage(
          image: AssetImage(WebPathUtil.loginBackgroundPNG),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: GlobalCard(
          color: ColorUtil.whiteScaffold,
          borderRadius: AppUtil.borderRadius50,
          margin: context.isMobile || context.isTablet
              ? const EdgeInsets.symmetric(horizontal: 20.0)
              : null,
          elevation: 10.0,
          child: SizedBox(
            width: 500,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.isMobile ? 20.0 : 60.0,
                vertical: context.isMobile ? 20.0 : 44.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      S.of(context).signIn,
                      style: AppUtil.textStyle(
                        context,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                        color: ColorUtil.blackColor,
                      ),
                    ),
                  ),
                  const _ErrorPopUp(),
                  const _EmailInput(),
                  const _PasswordInput(),
                  const SizedBox(height: 18.0),
                  const _LoginButton(),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: _ForgotPasswordButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
