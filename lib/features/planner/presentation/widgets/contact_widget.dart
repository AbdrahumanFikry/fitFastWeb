part of '../pages/planner_page.dart';

class _ContactWidget extends StatelessWidget {
  final IconData iconData;
  final String? title;
  final Function()? onTap;

  const _ContactWidget({
    Key? key,
    required this.iconData,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                iconData,
                color: ColorUtil.primaryColor,
                size: kIconsSize,
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
      ),
    );
  }
}
