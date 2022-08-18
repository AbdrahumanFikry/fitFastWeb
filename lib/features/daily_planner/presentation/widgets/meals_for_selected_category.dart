part of '../pages/daily_planner_page.dart';

class _MealsForSelectedCategory extends StatelessWidget {
  const _MealsForSelectedCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      color: ColorUtil.whiteScaffold,
      borderRadius: AppUtil.borderRadius20,
      child: Column(
        crossAxisAlignment: context.isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Meat Meals",
              style: AppUtil.textStyle(
                context,
                fontWeight: FontWeight.w500,
                color: ColorUtil.blackColor,
                fontSize: 24.0,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const _MealsList(),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class _MealsList extends StatelessWidget {
  const _MealsList({Key? key}) : super(key: key);
  static const _meals = [
    "Meat Meals",
    "Vegetarian Meals",
    "Chicken Meals",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.isMobile ? null : 340,
      child: BlocBuilder<DailyPlannerBloc, DailyPlannerState>(
        builder: (context, state) => ListView.builder(
          shrinkWrap: context.isMobile,
          scrollDirection: context.isMobile ? Axis.vertical : Axis.horizontal,
          physics:
              context.isMobile ? const NeverScrollableScrollPhysics() : null,
          padding: EdgeInsets.symmetric(
            horizontal: context.isMobile ? 5.0 : 20.0,
          ),
          itemCount: _meals.length,
          itemBuilder: (context, index) {
            return _MealCard(
              title: _meals[index],
              selected: index == 0,
            );
          },
        ),
      ),
    );
  }
}

class _MealCard extends StatelessWidget {
  final String title;
  final bool selected;

  const _MealCard({
    Key? key,
    required this.title,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      color: ColorUtil.lightGreyColor,
      borderColor: selected ? ColorUtil.accentColor : null,
      borderRadius: AppUtil.borderRadius30,
      margin: context.isMobile
          ? const EdgeInsets.only(right: 25.0, top: 20.0, left: 10.0)
          : const EdgeInsets.only(top: 5.0, right: 50.0),
      child: Container(
        width: 260.0,
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: context.isMobile
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              WebPathUtil.mealPNG,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.fill,
            ),
            if (context.isWebOrDesktop) const Spacer(),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$120",
                  style: AppUtil.textStyle(
                    context,
                    fontWeight: FontWeight.w500,
                    color: ColorUtil.greyColor,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
                if (context.isMobile)
                  SizedBox(width: context.screenWidth / 4)
                else
                  const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5.0,
                    left: 5.0,
                    right: 5.0,
                  ),
                  child: SvgPicture.asset(
                    WebPathUtil.starSVG,
                    height: 18.0,
                    width: 18.0,
                    color: ColorUtil.accentColor,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "4.5",
                  style: AppUtil.textStyle(
                    context,
                    fontWeight: FontWeight.w500,
                    color: ColorUtil.accentColor,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                const SizedBox(width: 2.0),
                Text(
                  "(120)",
                  style: AppUtil.textStyle(
                    context,
                    fontWeight: FontWeight.w500,
                    color: ColorUtil.mediumGreyColor,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              "Meat With Rice",
              style: AppUtil.textStyle(
                context,
                fontWeight: FontWeight.w500,
                color: selected ? ColorUtil.accentColor : ColorUtil.blackColor,
                fontSize: 20.0,
              ),
              textAlign: context.isMobile ? TextAlign.center : TextAlign.start,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10.0),
            Text(
              "Traditional tine dishes, couscous and fresh salad",
              style: AppUtil.textStyle(
                context,
                fontWeight: FontWeight.w500,
                color: ColorUtil.greyColor,
                fontSize: 14.0,
              ),
              textAlign: context.isMobile ? TextAlign.center : TextAlign.start,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlobalCard(
                  color: selected
                      ? ColorUtil.accentColor
                      : ColorUtil.lightOrangeColor,
                  borderRadius: AppUtil.borderRadius30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 12.0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          selected
                              ? WebPathUtil.tickSquareSVG
                              : WebPathUtil.addSquareSVG,
                          height: 24.0,
                          width: 24.0,
                          color: selected ? null : ColorUtil.accentColor,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(width: 12.0),
                        Text(
                          selected
                              ? S.of(context).chosen
                              : S.of(context).choose,
                          style: AppUtil.textStyle(
                            context,
                            fontWeight: FontWeight.w500,
                            color: selected
                                ? ColorUtil.whiteScaffold
                                : ColorUtil.accentColor,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (context.isMobile)
                  const SizedBox(width: 10.0)
                else
                  const Spacer(),
                GlobalCard(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      insetPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 40.0,
                      ),
                      contentPadding: EdgeInsets.zero,
                      backgroundColor: ColorUtil.whiteScaffold,
                      shape: ContinuousRectangleBorder(
                        borderRadius: AppUtil.borderRadius40,
                      ),
                      content: const MealDetails(),
                    ),
                  ),
                  color: Colors.transparent,
                  borderColor: ColorUtil.accentColor,
                  borderRadius: AppUtil.borderRadius30,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14.0,
                      vertical: 16.0,
                    ),
                    child: Text(
                      S.of(context).details,
                      style: AppUtil.textStyle(
                        context,
                        fontWeight: FontWeight.w500,
                        color: ColorUtil.accentColor,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
