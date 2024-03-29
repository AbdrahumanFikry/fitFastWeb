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
        children: const [
          _MealDatePicker(),
          _MealsForSelectedCategory(),
          SizedBox(height: 30.0),
          _Cart(),
        ],
      ),
    );
  }
}
