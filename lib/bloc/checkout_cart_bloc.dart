import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../data/models/product.dart';

part 'checkout_cart_event.dart';
part 'checkout_cart_state.dart';

class CheckoutCartBloc extends Bloc<CheckoutCartEvent, CheckoutCartState> {
  CheckoutCartBloc() : super(CheckoutCartInitial()) {
    on<LoadCheckoutCart>(
        (event, emit) async {
          await Future.delayed(
              const Duration(seconds: 5)
          );
        }
    );
    on<AddToCheckoutCart>(
        (event, emit){
          if(state is CheckoutCartLoaded){
            final state = this.state as CheckoutCartLoaded;
            emit(
              CheckoutCartLoaded(
                  products: List.from(state.products)..add(event.product)
              )
            );
          }
        },
    );
    on<RemoveCheckoutCart>(
        (event, emit){
          if (state is CheckoutCartLoaded){
            final state = this.state as CheckoutCartLoaded;
            emit(
              CheckoutCartLoaded(
                  products: List.from(state.products)..remove(event.product)
              )
            );
          }
        },
    );
  }
}
