import 'package:cartiez/bloc/checkout_cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutCartPage extends StatefulWidget {
  const CheckoutCartPage({Key? key}) : super(key: key);

  @override
  _CheckoutCartPageState createState() => _CheckoutCartPageState();
}

class _CheckoutCartPageState extends State<CheckoutCartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCartBloc, CheckoutCartState>(
      builder: (context, state) {
        if (state is CheckoutCartLoaded){
          return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(""),
                            fit: BoxFit.fitWidth
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  title: Text("Item Count"),
                  trailing: ElevatedButton(
                    onPressed: () {  },
                    child: Text("Clear"),
                  ),
                );
              }
              );
        } else {
          return Text("Something went wrong");
        }
      }
    );
  }
}
