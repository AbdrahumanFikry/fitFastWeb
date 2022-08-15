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
        child: context.isWebOrDesktop
            ? Row(
                children: const [
                  Expanded(flex: 1, child: _PlanCategoryPicker()),
                  SizedBox(width: 30.0),
                  Expanded(flex: 2, child: _MealsPicker())
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    _PlanCategoryPicker(),
                    _MealsPicker(),
                  ],
                ),
              ),
      ),
    );
  }
}
