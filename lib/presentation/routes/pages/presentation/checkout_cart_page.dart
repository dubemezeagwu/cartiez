import 'package:cartiez/presentation/helpers/cart_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/cart/cart_bloc.dart';
import '../../../../utils/constants.dart';

class CheckoutCartPage extends StatefulWidget {
  const CheckoutCartPage({Key? key}) : super(key: key);

  @override
  State<CheckoutCartPage> createState() => _CheckoutCartPageState();
}

class _CheckoutCartPageState extends State<CheckoutCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state){
            if (state is CartLoading){
              return Constants.chuckyLoader();
            }
            if (state is CartLoaded){
              return ListView.builder(
                itemCount: state.cart.products.length,
                  itemBuilder: (context, index) {
                  final product = state.cart.products[index];
                  return CartProductCard(product: product);
                  });
            }
            return Text("Something went wrong!");
          },
        )
      )
    );
  }
}
