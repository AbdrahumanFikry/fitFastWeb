part of '../pages/cart_page.dart';

class _CartSummary extends StatelessWidget {
  const _CartSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> summaryWidgets = [
      const _TotalWidget(),
      context.isWebOrDesktop ? const Spacer() : const SizedBox(height: 5.0),
      const _TotalCostWidget(),
      const SizedBox(width: 10.0, height: 10.0),
      const _CheckoutButton(),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: !context.isWebOrDesktop
          ? Column(children: summaryWidgets)
          : Row(children: summaryWidgets),
    );
  }
}
