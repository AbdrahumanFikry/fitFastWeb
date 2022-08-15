part of '../pages/daily_planner_page.dart';

class _MealCategories extends StatelessWidget {
  const _MealCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 22.0,
        right: 22.0,
        top: 12.0,
        bottom: 10.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: context.isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).pickMealCategory,
            style: AppUtil.textStyle(
              context,
              fontWeight: FontWeight.w500,
              color: ColorUtil.blackColor,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12.0),
          if (context.isMobile || context.isTablet)
            const _CategoriesGrid()
          else
            const Expanded(child: _CategoriesGrid()),
        ],
      ),
    );
  }
}

class _CategoriesGrid extends StatelessWidget {
  const _CategoriesGrid({Key? key}) : super(key: key);
  static const _categories = [
    "Meat Meals",
    "Vegetarian Meals",
    "Chicken Meals",
    "Seafood Meals"
  ];

  @override
  Widget build(BuildContext context) {
    final isStatic = context.isMobile || context.isTablet;
    return BlocBuilder<DailyPlannerBloc, DailyPlannerState>(
      buildWhen: (previous, current) =>
          previous.selectedCategory != current.selectedCategory,
      builder: (context, state) => GridView.builder(
        shrinkWrap: isStatic,
        physics: isStatic ? const NeverScrollableScrollPhysics() : null,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.isMobile ? 1 : 2,
          childAspectRatio: 1,
          crossAxisSpacing: 25.0,
          mainAxisSpacing: 25.0,
          mainAxisExtent: context.isMobile ? 100.0 : 180.0,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final selected = state.selectedCategory?.toLowerCase() ==
              _categories[index].toLowerCase();
          return _CategoryCard(
            title: _categories[index],
            selected: selected,
          );
        },
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final bool selected;

  const _CategoryCard({
    Key? key,
    required this.title,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      onTap: () => context.read<DailyPlannerBloc>().add(
            SelectCategory(title.toLowerCase()),
          ),
      color: !selected ? ColorUtil.lightGreyColor : ColorUtil.lightOrangeColor,
      borderRadius: AppUtil.borderRadius20,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: context.isMobile
              ? Row(
                  children: [
                    Image.asset(
                      WebPathUtil.mealPNG,
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.fill,
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: AppUtil.textStyle(
                              context,
                              fontWeight: FontWeight.w500,
                              color: selected
                                  ? ColorUtil.accentColor
                                  : ColorUtil.blackColor,
                              fontSize: 20.0,
                            ),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 15.0),
                          Text(
                            "3 Meals",
                            style: AppUtil.textStyle(
                              context,
                              fontWeight: FontWeight.w500,
                              color: ColorUtil.greyColor,
                              fontSize: 15.0,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Image.asset(
                        WebPathUtil.mealPNG,
                        width: double.infinity,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      title,
                      style: AppUtil.textStyle(
                        context,
                        fontWeight: FontWeight.w500,
                        color: selected
                            ? ColorUtil.accentColor
                            : ColorUtil.blackColor,
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 15.0),
                    Text(
                      "3 Meals",
                      style: AppUtil.textStyle(
                        context,
                        fontWeight: FontWeight.w500,
                        color: ColorUtil.greyColor,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
