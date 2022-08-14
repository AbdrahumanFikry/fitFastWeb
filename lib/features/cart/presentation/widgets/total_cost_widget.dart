part of '../pages/cart_page.dart';

class _TotalCostWidget extends StatelessWidget {
  const _TotalCostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Total Cost : ",
          style: AppUtil.textStyle(
            context,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: ColorUtil.blackColor,
          ),
        ),
        Text(
          "99.99 AED",
          style: AppUtil.textStyle(
            context,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: ColorUtil.greyColor,
          ),
        ),
      ],
    );
  }
}
