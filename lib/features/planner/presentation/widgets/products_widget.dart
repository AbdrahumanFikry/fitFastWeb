part of '../pages/planner_page.dart';

class _ProductsWidget extends StatelessWidget {
  const _ProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            context.isMobile ? ColorUtil.whiteScaffold : ColorUtil.primaryColor,
        borderRadius: !context.isMobile
            ? const BorderRadius.horizontal(left: Radius.circular(10.0))
            : null,
      ),
      padding: const EdgeInsets.only(
        right: 10.0,
        left: 10.0,
      ),
      child: Column(
        children: const [
          _ProductsDropDown(),
          Expanded(child: _ProductsList()),
        ],
      ),
    );
  }
}

class _ProductsDropDown extends StatelessWidget {
  const _ProductsDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final plannerBloc = context.read<PlannerBloc>();
    return BlocBuilder<PlannerBloc, PlannerState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) => AppDropDownSearch<String>(
        suggestionsBoxColor: ColorUtil.greyColor,
        margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        emptyListMessage: "No available producers",
        isBusy: false,
        typeAheadController: TextEditingController(),
        suffixWidget: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: ColorUtil.blackColor,
        ),
        itemLabel: (String model) => model,
        suggestionsCallback: plannerBloc.fetchProducts,
        itemBuilder: (context, String model) => SearchCard(title: model),
        onSelectItem: (String model) => plannerBloc.add(
          SelectCategoryEvent(model),
        ),
      ),
    );
  }
}

class _ProductsList extends StatelessWidget {
  const _ProductsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      padding: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (context, index) => const _ProductCard(),
      separatorBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Divider(
          color: ColorUtil.lightGreyColor,
          height: 1.0,
          thickness: 1.0,
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: AppUtil.borderRadius10,
          child: NetImage(
            "https://www.freepnglogos.com/uploads/food-png/food-grass-fed-beef-foodservice-products-grass-run-farms-4.png",
            height: 90.0,
            width: 90.0,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                "Steak with rice and salad",
                style: AppUtil.textStyle(
                  context,
                  fontSize: 15.0,
                  color: context.isMobile
                      ? ColorUtil.blackColor
                      : ColorUtil.whiteColor,
                ),
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2.5),
              RatingBar(
                initialRating: 3.5,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ignoreGestures: true,
                ratingWidget: RatingWidget(
                  full: const Icon(
                    Icons.star_outlined,
                    color: Colors.orange,
                  ),
                  half: const Icon(
                    Icons.star_half_outlined,
                    color: Colors.orange,
                  ),
                  empty: const Icon(
                    Icons.star_border_outlined,
                    color: Colors.orange,
                  ),
                ),
                itemSize: 18.0,
                itemPadding: EdgeInsets.zero,
                glowColor: ColorUtil.lightYellowColor,
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(height: 2.5),
              Text(
                "Price : 29.99 AED",
                style: AppUtil.textStyle(
                  context,
                  fontSize: 13.0,
                  color: context.isMobile
                      ? ColorUtil.blackColor
                      : ColorUtil.whiteColor,
                ),
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton.icon(
                    title: "Add",
                    elevation: 0.5,
                    context: context,
                    color: !context.isMobile
                        ? ColorUtil.whiteScaffold
                        : ColorUtil.primaryColor,
                    textColor: context.isMobile
                        ? ColorUtil.whiteColor
                        : ColorUtil.primaryColor,
                    shrink: true,
                    icon: Icon(
                      Icons.add_shopping_cart_rounded,
                      color: context.isMobile
                          ? ColorUtil.whiteColor
                          : ColorUtil.primaryColor,
                      size: 20.0,
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(width: 10.0),
                  if (context.isWebOrDesktop)
                    AppButton(
                      title: "View Details",
                      elevation: 0.5,
                      context: context,
                      backgroundColor: ColorUtil.blackColor80,
                      shrink: true,
                      onTap: () {},
                    ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
