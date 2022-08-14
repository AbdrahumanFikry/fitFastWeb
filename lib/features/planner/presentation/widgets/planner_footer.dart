part of '../pages/planner_page.dart';

class _PlannerFooter extends StatelessWidget {
  const _PlannerFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!context.isWebOrDesktop) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text(
        "All copyrights reserved  © to FitFast company 2022",
        style: AppUtil.textStyle(
          context,
          fontSize: 12.0,
          color: ColorUtil.greyColor,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
