part of '../pages/cart_page.dart';

class _TotalWidget extends StatelessWidget {
  const _TotalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Total : ",
          style: AppUtil.textStyle(
            context,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: ColorUtil.blackColor,
          ),
        ),
        const SizedBox(width: 10.0),
        GlobalCard(
          borderRadius: AppUtil.borderRadius10,
          borderColor: ColorUtil.blackColor,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "7 Days",
              style: AppUtil.textStyle(
                context,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: ColorUtil.blackColor,
              ),
            ),
          ),
        ),
        const SizedBox(width: 5.0),
        GlobalCard(
          borderRadius: AppUtil.borderRadius10,
          borderColor: ColorUtil.blackColor,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              "30 Units",
              style: AppUtil.textStyle(
                context,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: ColorUtil.blackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
