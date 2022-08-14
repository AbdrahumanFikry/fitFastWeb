part of '../pages/planner_page.dart';

class _PlannerTopBar extends StatelessWidget {
  const _PlannerTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.screenWidth,
          color: ColorUtil.whiteScaffold,
          padding: EdgeInsets.symmetric(
            horizontal: !context.isWebOrDesktop ? 20.0 : 0.0,
            vertical: context.isWebOrDesktop ? 30.0 : 10.0,
          ),
          child: IntrinsicHeight(
            child: Row(
              children: [
                const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.menu,
                    size: kIconsSize,
                    color: ColorUtil.blackColor,
                  ),
                ),
                const SizedBox(width: 5.0),
                const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.search,
                    size: kIconsSize,
                    color: ColorUtil.primaryColor,
                  ),
                ),
                if (context.isWebOrDesktop) ...[
                  const VerticalDivider(
                    width: 30.0,
                    color: ColorUtil.lightYellowColor,
                    thickness: 2.0,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  _ContactWidget(
                    iconData: Icons.mail,
                    title: "support@fitfast.com",
                    onTap: () {},
                  ),
                  const SizedBox(width: 5.0),
                  _ContactWidget(
                    iconData: Icons.whatsapp_rounded,
                    title: "+971 12345678",
                    onTap: () {},
                  ),
                ],
                const Spacer(),
                if (context.isWebOrDesktop) ...[
                  _ContactWidget(
                    iconData: Icons.facebook_rounded,
                    onTap: () {},
                  ),
                  _ContactWidget(
                    iconData: Icons.facebook_rounded,
                    onTap: () {},
                  ),
                  _ContactWidget(
                    iconData: Icons.facebook_rounded,
                    onTap: () {},
                  ),
                  _ContactWidget(
                    iconData: Icons.facebook_rounded,
                    onTap: () {},
                  ),
                  _ContactWidget(
                    iconData: Icons.facebook_rounded,
                    onTap: () {},
                  ),
                ],
                const _ProfileWidget(),
                if (context.isMobile) const _CartWidget(),
              ],
            ),
          ),
        ),
        if (!context.isMobile)
          Positioned.fill(
            child: Center(
              child: Image.asset(
                PathUtil.appLogo,
                width: 600.0,
                height: 600.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
      ],
    );
  }
}
