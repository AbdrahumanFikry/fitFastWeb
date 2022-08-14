part of '../pages/daily_planner_page.dart';

class _ProfileComponent extends StatelessWidget {
  const _ProfileComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) return const SizedBox.shrink();

    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: ColorUtil.mediumGreyColor,
        radius: 24.0,
        child: FittedBox(
          child: Center(
            child: Icon(
              Icons.person,
              size: 30.0,
              color: ColorUtil.whiteScaffold,
            ),
          ),
        ),
      ),
    );
  }
}
