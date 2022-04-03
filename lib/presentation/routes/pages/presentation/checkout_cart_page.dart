import 'package:cartiez/presentation/helpers/cart_product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/cart/cart_bloc.dart';

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
        child: ListView.builder(
          itemCount: 4,
            itemBuilder: (context, index) => CartProductCard()
        ),
      )
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Cart"),
    //   ),
    //   body: BlocBuilder<CartBloc, CartState>(
    //     builder: (context, state) {
    //       if (state is CartLoading){
    //         return Center(
    //             child: CircularProgressIndicator()
    //         );
    //       }
    //       if (state is CartLoaded){
    //         return Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           mainAxisSize: MainAxisSize.max,
    //           children: [
    //             Align(
    //                 alignment: Alignment.bottomCenter,
    //                 child: ElevatedButton(onPressed: () {},
    //                     child: Text("GO TO CHECKOUT")))
    //           ],
    //         );
    //       } else {
    //         return Center(child: Text("Something went wrong"));
    //       }
    //     },
    //   ),
    // );
  }
}
