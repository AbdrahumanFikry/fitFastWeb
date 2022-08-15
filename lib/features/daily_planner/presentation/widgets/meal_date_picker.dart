part of '../pages/daily_planner_page.dart';

class _MealDatePicker extends StatelessWidget {
  const _MealDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController =
        context.read<DailyPlannerBloc>().datesScrollController;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: BlocBuilder<DailyPlannerBloc, DailyPlannerState>(
        builder: (context, state) {
          return Row(
            children: [
              GlobalCard(
                onTap: () async => await scrollController.animateTo(
                  scrollController.offset - 130.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
                color: ColorUtil.mediumGreyColor,
                borderRadius: AppUtil.borderRadius20,
                margin: const EdgeInsets.only(right: 5.0),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(
                    WebPathUtil.arrowLeftSVG,
                    color: ColorUtil.accentColor,
                    width: 24.0,
                    height: 24.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 45.0,
                  child: ListView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      10,
                      (index) {
                        final date = DateTime.now().add(Duration(days: index));
                        final selected = date.day == state.selectedDate?.day &&
                            date.month == state.selectedDate?.month;
                        return _DayCard(
                          dateTime: date,
                          selected: selected,
                        );
                      },
                    ),
                  ),
                ),
              ),
              GlobalCard(
                onTap: () async => await scrollController.animateTo(
                  scrollController.offset + 130.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
                color: ColorUtil.mediumGreyColor,
                borderRadius: AppUtil.borderRadius20,
                margin: const EdgeInsets.only(left: 5.0),
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: SvgPicture.asset(
                    WebPathUtil.arrowRightSVG,
                    color: ColorUtil.accentColor,
                    width: 24.0,
                    height: 24.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _DayCard extends StatelessWidget {
  final DateTime dateTime;
  final bool selected;

  const _DayCard({
    Key? key,
    required this.dateTime,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      onTap: () => context.read<DailyPlannerBloc>().add(SelectDate(dateTime)),
      color: !selected ? ColorUtil.greyWithYellowColor : ColorUtil.accentColor,
      borderRadius: AppUtil.borderRadius20,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Text(
                dateTime.toFormattedDate('dd'),
                style: AppUtil.textStyle(
                  context,
                  fontWeight: FontWeight.w400,
                  color: selected ? ColorUtil.whiteColor : ColorUtil.greyColor,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(width: 12.0),
              Text(
                dateTime.toFormattedDate('EEE'),
                style: AppUtil.textStyle(
                  context,
                  fontWeight: FontWeight.w500,
                  color: selected ? ColorUtil.whiteColor : ColorUtil.greyColor,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
