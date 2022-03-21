part of 'checkout_cart_bloc.dart';

abstract class CheckoutCartState extends Equatable {
  const CheckoutCartState();
}

class CheckoutCartInitial extends CheckoutCartState {
  @override
  List<Object> get props => [];
}

class CheckoutCartLoaded extends CheckoutCartState{
  final List<Product> products;

  const CheckoutCartLoaded({required this.products });

  @override
  List<Object> get props => [products];
}