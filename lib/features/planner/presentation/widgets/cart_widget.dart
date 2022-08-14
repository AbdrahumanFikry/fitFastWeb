part of '../pages/planner_page.dart';

class _CartWidget extends StatelessWidget {
  const _CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, CartPage.routeName),
            child: Icon(
              Icons.shopping_cart,
              size: !context.isMobile ? 36.0 : kIconsSize,
              color: ColorUtil.mediumGreyColor,
            ),
          ),
        ),
        Positioned(
          top: 0.0,
          right: 0.0,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).errorColor,
            radius: 10.0,
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    "0",
                    style: AppUtil.textStyle(
                      context,
                      color: ColorUtil.whiteColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
