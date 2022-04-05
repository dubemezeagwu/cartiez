import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cartiez/data/repository/cart_repository.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/cart.dart';
import '../../data/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.cartRepository}) : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartProductAdded>(_onProductAdded);
    on<CartProductRemoved>(_onProductRemoved);
  }

  final CartRepository cartRepository;

  void _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit (CartLoading());
    try{
      final cartItem = await cartRepository.loadCartItems();
      emit(CartLoaded(cart: Cart(products: [...cartItem])));
    } catch (_){
      emit(CartError());
    }
  }

  void _onProductAdded(CartProductAdded event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded){
      try {
        cartRepository.addItemToCart(event.product);
        emit (CartLoaded(cart: Cart(products: [...state.cart.products, event.product])));
      } catch (_){
        emit(CartError());
      }
    }
  }

  void _onProductRemoved(CartProductRemoved event, Emitter<CartState> emit) async {
    final state = this.state;
    if(state is CartLoaded){
      try{
        cartRepository.removeItemFromCart(event.product);
        emit(
          CartLoaded(
            cart: Cart(
              products: [...state.cart.products]..remove(event.product),
            )
          )
        );
      } catch (_){
        emit(CartError());
      }
    }
  }
}
