part of '../pages/daily_planner_page.dart';

class _MealsPicker extends StatelessWidget {
  const _MealsPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _MealDatePicker(),
          if (context.isWebOrDesktop)
            const Expanded(child: _MealsForSelectedCategory())
          else
            const _MealsForSelectedCategory(),
          const SizedBox(height: 30.0),
          const _Cart(),
        ],
      ),
    );
  }
}
