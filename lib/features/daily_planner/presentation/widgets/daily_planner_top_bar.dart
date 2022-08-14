part of '../pages/daily_planner_page.dart';

class _DailyPlannerTopBar extends StatelessWidget {
  const _DailyPlannerTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.screenWidth,
          color: ColorUtil.whiteScaffold,
          padding: EdgeInsets.symmetric(
            horizontal: context.isWebOrDesktop ? 0.0 : 15.0,
            vertical: context.isWebOrDesktop ? 36.0 : 10.0,
          ),
          child: WebContainer(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  const _ProfileComponent(),
                  const Spacer(),
                  if (context.isWebOrDesktop) ...[
                    _ContactWidget(
                      svgPath: WebPathUtil.instagramSVG,
                      onTap: () {},
                    ),
                    _ContactWidget(
                      svgPath: WebPathUtil.whatsappSVG,
                      onTap: () {},
                    ),
                    _ContactWidget(
                      svgPath: WebPathUtil.facebookSVG,
                      onTap: () {},
                    ),
                    _ContactWidget(
                      svgPath: WebPathUtil.instagramSVG,
                      onTap: () {},
                    ),
                    _ContactWidget(
                      svgPath: WebPathUtil.twitterSVG,
                      onTap: () {},
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        if (!context.isMobile)
          Positioned.fill(
            child: Center(
              child: SvgPicture.asset(
                WebPathUtil.fitFastLogoVerticalSVG,
                width: 260.0,
                height: 36.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
      ],
    );
  }
}
