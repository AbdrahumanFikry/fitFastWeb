part of '../pages/daily_planner_page.dart';

class _DailyPlannerTopBar extends StatelessWidget {
  const _DailyPlannerTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
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
                        const _ProfileComponent(),
                        const Spacer(),
                      ],
                      const ContactLinks(),
                    ],
                  ),
                ),
              ),
            ),
            if (context.isWebOrDesktop)
              Positioned.fill(
                child: Center(
                  child: Image.asset(
                    WebPathUtil.appLogo,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
          ],
        ),
        if (context.isMobile || context.isTablet)
          Container(
            width: context.screenWidth,
            color: ColorUtil.whiteScaffold,
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 36.0,
            ),
            child: Row(
              children: [
                Image.asset(
                  WebPathUtil.appLogo,
                  fit: BoxFit.fitHeight,
                ),
                const Spacer(),
                GlobalCard(
                  onTap: () {},
                  color: ColorUtil.lightOrangeColor,
                  borderRadius: AppUtil.borderRadius20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      WebPathUtil.gridSVG,
                      height: 30.0,
                      width: 30.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
