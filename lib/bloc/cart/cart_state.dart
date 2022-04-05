part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoading extends CartState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class CartLoaded extends CartState{
  final Cart cart;
  const CartLoaded({this.cart = const Cart()});

  @override
  List<Object> get props => [cart];
}

class ItemAddedToCart extends CartState{
  final List<Product> products;

  ItemAddedToCart({required this.products});
}

class ItemDeletedFromCart extends CartState {
  final List<Product> products;

  ItemDeletedFromCart({required this.products});
}

class CartError extends CartState {
  @override
  List<Object> get props => [];
}

