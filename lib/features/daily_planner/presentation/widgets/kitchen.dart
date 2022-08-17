part of '../pages/daily_planner_page.dart';

class _Kitchen extends StatelessWidget {
  const _Kitchen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtil.lightGreyColor,
      margin: const EdgeInsets.only(bottom: 20.0),
      child: WebConstraints(
        child: context.isWebOrDesktop
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(flex: 1, child: _PlanCategoryPicker()),
                  SizedBox(width: 30.0),
                  Expanded(flex: 2, child: _MealsPicker())
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  _PlanCategoryPicker(),
                  _MealsPicker(),
                ],
              ),
      ),
    );
  }
}
