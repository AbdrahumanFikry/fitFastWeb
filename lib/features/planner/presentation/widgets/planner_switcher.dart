part of '../pages/planner_page.dart';

class _PlannerSwitcher extends StatelessWidget {
  const _PlannerSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<PlannerBloc, PlannerState>(
          buildWhen: (previous, current) =>
              previous.planIndex != current.planIndex,
          builder: (context, state) => GlobalCard(
            borderRadius: AppUtil.borderRadius12,
            borderColor: ColorUtil.primaryColor,
            child: SizedBox(
              height: 40.0,
              width: context.isMobile ? context.screenWidth * 0.75 : 400,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          context.read<PlannerBloc>().add(ChangePlanEvent(0)),
                      child: GlobalCard(
                        color: state.planIndex == 0
                            ? ColorUtil.primaryColor
                            : Colors.transparent,
                        margin: EdgeInsets.zero,
                        child: Center(
                          child: Text(
                            "Daily Planner",
                            style: AppUtil.textStyle(
                              context,
                              fontSize: context.isMobile ? 12.0 : 14.0,
                              color: state.planIndex == 0
                                  ? ColorUtil.whiteScaffold
                                  : ColorUtil.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          context.read<PlannerBloc>().add(ChangePlanEvent(1)),
                      child: GlobalCard(
                        color: state.planIndex == 0
                            ? Colors.transparent
                            : ColorUtil.primaryColor,
                        margin: EdgeInsets.zero,
                        child: Center(
                          child: Text(
                            "Product Planner",
                            style: AppUtil.textStyle(
                              context,
                              fontSize: context.isMobile ? 12.0 : 14.0,
                              color: state.planIndex == 0
                                  ? ColorUtil.primaryColor
                                  : ColorUtil.whiteScaffold,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Choose your favourite way to fill your basket",
            style: AppUtil.textStyle(
              context,
              fontSize: 12.0,
              color: ColorUtil.greyColor,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
