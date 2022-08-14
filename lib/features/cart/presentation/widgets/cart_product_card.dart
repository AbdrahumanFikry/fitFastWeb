part of '../pages/cart_page.dart';

class _CartProductCard extends StatelessWidget {
  const _CartProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorUtil.whiteScaffold,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GlobalCard(
            borderRadius: AppUtil.borderRadius10,
            child: NetImage(
              "https://www.freepnglogos.com/uploads/food-png/food-grass-fed-beef-foodservice-products-grass-run-farms-4.png",
              height: context.isWebOrDesktop ? 120.0 : 100.0,
              width: context.isWebOrDesktop ? 120.0 : 100.0,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Steak with rice",
                  style: AppUtil.textStyle(
                    context,
                    fontSize: 16.0,
                    color: ColorUtil.blackColor80,
                  ),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
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
                  itemSize: 20.0,
                  itemPadding: EdgeInsets.zero,
                  glowColor: ColorUtil.lightYellowColor,
                  onRatingUpdate: (rating) {},
                ),
                Text(
                  "Price : 29.99 AED",
                  style: AppUtil.textStyle(
                    context,
                    fontSize: 14.0,
                    color: ColorUtil.blackColor60,
                  ),
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5.0),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GlobalCard(
                      borderRadius: AppUtil.borderRadius12,
                      borderColor: ColorUtil.greyColor,
                      child: SizedBox(
                        height: 30.0,
                        child: Row(
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints.tightFor(
                                height: 28.0,
                                width: 28.0,
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove,
                                color: ColorUtil.blackColor80,
                                size: 20.0,
                              ),
                            ),
                            const VerticalDivider(
                              color: ColorUtil.greyColor,
                              width: 1.0,
                              thickness: 1.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 3.0,
                              ),
                              child: FittedBox(
                                child: Text(
                                  "12",
                                  style: AppUtil.textStyle(
                                    context,
                                    fontSize: 14.0,
                                    color: ColorUtil.blackColor80,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            const VerticalDivider(
                              color: ColorUtil.greyColor,
                              width: 1.0,
                              thickness: 1.0,
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints.tightFor(
                                height: 28.0,
                                width: 28.0,
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: ColorUtil.blackColor80,
                                size: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    GlobalCard(
                      color: ColorUtil.primaryColor,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints.tightFor(
                          height: 35.0,
                          width: 35.0,
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: ColorUtil.whiteScaffold,
                          size: 16.0,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
