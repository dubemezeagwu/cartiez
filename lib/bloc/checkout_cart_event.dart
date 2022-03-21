part of 'checkout_cart_bloc.dart';

abstract class CheckoutCartEvent extends Equatable {
  const CheckoutCartEvent();

  @override
  List<Product> get props => [];
}

class LoadCheckoutCart extends CheckoutCartEvent {}

class AddToCheckoutCart extends CheckoutCartEvent{
  final Product product;

  AddToCheckoutCart({required this.product});
}

class RemoveCheckoutCart extends CheckoutCartEvent{
  final Product product;

  RemoveCheckoutCart({required this.product});
}