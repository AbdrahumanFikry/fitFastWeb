part of '../pages/cart_page.dart';

class _CheckoutButton extends StatelessWidget {
  const _CheckoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) => AppButton(
        shrink: true,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        title: "Proceed To Checkout",
        onTap: () {},
        context: context,
      ),
    );
  }
}
