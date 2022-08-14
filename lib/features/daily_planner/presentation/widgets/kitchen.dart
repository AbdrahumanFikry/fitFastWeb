part of '../pages/daily_planner_page.dart';

class _Kitchen extends StatelessWidget {
  const _Kitchen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bottomPadding = 0.0;
    if (context.screenWidth > 1400) {
      bottomPadding = 60.0;
    } else if (context.isMobile || context.isTablet) {
      bottomPadding = 0.0;
    } else {
      bottomPadding = 20.0;
    }
    return Container(
      color: ColorUtil.lightGreyColor,
      margin: EdgeInsets.only(bottom: bottomPadding),
      child: WebContainer(
        child: Row(
          children: [
            const Expanded(flex: 1, child: _PlanCategoryPicker()),
            if (context.isWebOrDesktop) ...const [
              SizedBox(width: 30.0),
              Spacer(flex: 2),
            ],
          ],
        ),
      ),
    );
  }
}
