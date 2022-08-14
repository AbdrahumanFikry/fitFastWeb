import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fit_fast_core/fit_fast_core.dart';
import '../bloc/cart_bloc.dart';

part '../widgets/cart_summary.dart';

part '../widgets/checkout_button.dart';

part '../widgets/total_cost_widget.dart';

part '../widgets/total_widget.dart';

part '../widgets/calender_widget.dart';

part '../widgets/cart_products.dart';

part '../widgets/cart_product_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  static const String routeName = "/cart";

  static MaterialPageRoute<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const CartPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartBloc>(
      create: (context) => CartBloc(),
      child: BlocListener<CartBloc, CartState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {},
        child: const _CartWidgets(),
      ),
    );
  }
}

class _CartWidgets extends StatelessWidget {
  const _CartWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: const [
          _CartSummary(),
          Divider(color: ColorUtil.greyColor, thickness: 1.0, height: 1.0),
          _CalenderWidget(),
          Expanded(child: _CartProducts()),
        ],
      ),
    );
  }
}
