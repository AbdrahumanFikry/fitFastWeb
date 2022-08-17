part of '../pages/login_page.dart';

class _LoginTopBar extends StatelessWidget {
  const _LoginTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: context.screenWidth,
          color: context.isMobile || context.isTablet
              ? Colors.transparent
              : ColorUtil.whiteScaffold,
          padding: EdgeInsets.symmetric(
            horizontal: context.isWebOrDesktop ? 0.0 : 15.0,
            vertical: context.isWebOrDesktop ? 24.0 : 10.0,
          ),
          child: WebConstraints(
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (context.isWebOrDesktop) ...[
                    Image.asset(
                      WebPathUtil.appLogo,
                      fit: BoxFit.fitHeight,
                    ),
                    const Spacer(),
                  ],
                  const ContactLinks(),
                ],
              ),
            ),
          ),
        ),
        if (context.isMobile || context.isTablet)
          Container(
            width: context.screenWidth,
            color: ColorUtil.whiteScaffold,
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 36.0,
            ),
            child: Center(
              child: Image.asset(
                WebPathUtil.appLogo,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
      ],
    );
  }
}
