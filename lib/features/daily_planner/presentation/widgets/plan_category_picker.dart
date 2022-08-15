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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _PlanLevels(),
            if (context.isMobile || context.isTablet)
              const _MealCategories()
            else
              const Expanded(child: _MealCategories()),
          ],
        ),
      ),
    );
  }
}
