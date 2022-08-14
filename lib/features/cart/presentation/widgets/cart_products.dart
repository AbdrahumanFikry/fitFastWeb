part of '../pages/cart_page.dart';

class _CartProducts extends StatelessWidget {
  const _CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 1;
    if (context.isSmallWebOrDesktop) {
      crossAxisCount = 2;
    } else if (context.isWebOrDesktop) {
      crossAxisCount = 3;
    } else if (context.isTablet) {
      crossAxisCount = 1;
    } else {
      crossAxisCount = 1;
    }

    return Container(
      decoration: BoxDecoration(
        color: ColorUtil.lightGreyColor,
        borderRadius: !context.isMobile
            ? const BorderRadius.horizontal(right: Radius.circular(10.0))
            : null,
      ),
      child: GridView.builder(
        itemCount: 7,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 2,
          mainAxisExtent: 150.0,
        ),
        itemBuilder: (context, index) => const _CartProductCard(),
      ),
    );
  }
}
