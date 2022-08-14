part of '../pages/daily_planner_page.dart';

class _ContactWidget extends StatelessWidget {
  final String svgPath;
  final String? title;
  final Function()? onTap;

  const _ContactWidget({
    Key? key,
    required this.svgPath,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              svgPath,
              width: 24.0,
              height: 24.0,
              fit: BoxFit.fill,
            ),
          ),
          if (title != null && context.isWebOrDesktop)
            Text(
              title!,
              style: AppUtil.textStyle(
                context,
                fontSize: 14.0,
                color: ColorUtil.blackColor,
              ),
            ),
        ],
      ),
    );
  }
}
