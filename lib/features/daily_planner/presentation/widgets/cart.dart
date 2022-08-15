part of '../pages/daily_planner_page.dart';

class _Cart extends StatelessWidget {
  const _Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      color: ColorUtil.accentColor,
      borderRadius: AppUtil.borderRadius30,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 30.0),
        child: context.isMobile
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _CartItemCard(title: "Meat With Rice"),
                  const SizedBox(height: 20.0),
                  AppButton(
                    onTap: () {},
                    context: context,
                    elevation: 0.0,
                    fontSize: 14.0,
                    title: S.of(context).checkout,
                    textColor: ColorUtil.accentColor,
                    borderRadius: AppUtil.borderRadius20,
                    backgroundColor: ColorUtil.whiteColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35.0,
                      vertical: 20.0,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _CartItemCard(title: "Meat With Rice"),
                  const Spacer(),
                  AppButton(
                    onTap: () {},
                    shrink: true,
                    context: context,
                    elevation: 0.0,
                    fontSize: 14.0,
                    title: S.of(context).checkout,
                    textColor: ColorUtil.accentColor,
                    borderRadius: AppUtil.borderRadius20,
                    backgroundColor: ColorUtil.whiteColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35.0,
                      vertical: 20.0,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final String title;

  const _CartItemCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalCard(
      color: ColorUtil.whiteScaffold,
      borderRadius: AppUtil.borderRadius20,
      child: Container(
        width: context.isMobile ? double.infinity : 300,
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: context.isMobile
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            Image.asset(
              WebPathUtil.mealPNG,
              width: 36.0,
              height: 36.0,
              fit: BoxFit.fill,
            ),
            const SizedBox(width: 10.0),
            Text(
              title,
              style: AppUtil.textStyle(
                context,
                fontWeight: FontWeight.w500,
                color: ColorUtil.blackColor,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
