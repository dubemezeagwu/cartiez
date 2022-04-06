import 'package:cartiez/presentation/helpers/cart_product_card.dart';
import 'package:cartiez/presentation/helpers/reusable_card.dart';
import 'package:cartiez/utils/styles.dart';
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
        child: Stack(
          children: [
            BlocBuilder<CartBloc, CartState>(
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
            ),
            Positioned(
                bottom: 0,
                width: 400,
                child: ReusableCard(
                  boxShadowColor: Constants.primaryColor,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                          if (state is CartLoading) {
                            return const CircularProgressIndicator();
                          }
                          if (state is CartLoaded) {
                            return Text('\$${state.cart.totalPrice}', style: bold20,);
                          }
                          return const Text('Something went wrong!');
                        }),
                        const SizedBox(width: 24),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Buying not supported yet.')),
                            );
                          },
                          style: ElevatedButton.styleFrom(primary: Constants.primaryColor),
                          child: Text('BUY', style: bold14,),
                        ),
                      ],
                    ),
                  ),)
            )
          ],
        )
      )
    );
  }
}
