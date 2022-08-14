part of '../pages/daily_planner_page.dart';

class _PlanCategoryPicker extends StatelessWidget {
  const _PlanCategoryPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      color: ColorUtil.whiteColor,
      borderRadius: AppUtil.borderRadius20,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: context.isMobile || context.isTablet
            ? ListView(children: const [_PlanLevels(), _MealCategories()])
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _PlanLevels(),
                  Expanded(child: _MealCategories()),
                ],
              ),
      ),
    );
  }
}
