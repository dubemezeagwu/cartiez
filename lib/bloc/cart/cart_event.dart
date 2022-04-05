part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent{
  @override
  List<Object> get props => [];
}

class CartProductAdding extends CartEvent {
  final List<Product> products;

  CartProductAdding({required this.products});
}

class CartProductAdded extends CartEvent{
  final Product product;

  CartProductAdded({required this.product});

  @override
  List<Object> get props => [product];
}

class CartProductRemoved extends CartEvent{
  final Product product;
  final int? index;
  CartProductRemoved({required this.product,this.index,});

  @override
  List<Object> get props => [product];
}
