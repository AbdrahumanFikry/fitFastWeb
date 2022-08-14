part of '../pages/planner_page.dart';

class _ProductsCartWidget extends StatelessWidget {
  const _ProductsCartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.isMobile) return const _ProductsWidget();

    int cartFlex = 1;
    if (context.isSmallWebOrDesktop) {
      cartFlex = 2;
    } else if (context.isWebOrDesktop) {
      cartFlex = 3;
    } else {
      cartFlex = 1;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppUtil.borderRadius10,
        border: Border.all(color: ColorUtil.greyColor, width: 1.0),
      ),
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: !context.isMobile ? 20.0 : 0.0,
      ),
      child: Row(
        children: [
          const Expanded(flex: 1, child: _ProductsWidget()),
          Expanded(flex: cartFlex, child: const CartPage()),
        ],
      ),
    );
  }
}
