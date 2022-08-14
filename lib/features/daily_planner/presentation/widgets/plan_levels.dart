part of '../pages/daily_planner_page.dart';

class _PlanLevels extends StatelessWidget {
  const _PlanLevels({Key? key}) : super(key: key);

  static const _levels = ["Silver", "Gold", "Platinum"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 22.0,
        top: 12.0,
        bottom: 12.0,
        right: context.isMobile ? 22.0 : 5.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: context.isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).pickAPlan,
            style: AppUtil.textStyle(
              context,
              fontWeight: FontWeight.w500,
              color: ColorUtil.blackColor,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
          BlocBuilder<DailyPlannerBloc, DailyPlannerState>(
            buildWhen: (previous, current) =>
                previous.selectedPlan != current.selectedPlan,
            builder: (context, state) => SizedBox(
              height: context.isMobile ? null : 84.0,
              child: ListView.builder(
                shrinkWrap: context.isMobile,
                physics: context.isMobile
                    ? const NeverScrollableScrollPhysics()
                    : null,
                scrollDirection:
                    context.isMobile ? Axis.vertical : Axis.horizontal,
                itemCount: _levels.length,
                itemBuilder: (context, index) {
                  final selected = state.selectedPlan?.toLowerCase() ==
                      _levels[index].toLowerCase();
                  return _PlanLevelCard(
                    title: _levels[index],
                    selected: selected,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanLevelCard extends StatelessWidget {
  final String title;
  final bool selected;

  const _PlanLevelCard({
    Key? key,
    required this.title,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      onTap: () => context.read<DailyPlannerBloc>().add(
            SelectPlan(title.toLowerCase()),
          ),
      color: !selected ? ColorUtil.lightGreyColor : ColorUtil.accentColor,
      borderRadius: AppUtil.borderRadius15,
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 6.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 17.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                WebPathUtil.crownSVG,
                width: 30.0,
                height: 24.0,
                fit: BoxFit.fill,
                color: selected ? ColorUtil.whiteColor : ColorUtil.blackColor,
              ),
              const SizedBox(width: 6.0),
              Text(
                title,
                style: AppUtil.textStyle(
                  context,
                  fontWeight: FontWeight.w400,
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
