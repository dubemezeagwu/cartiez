import 'package:cartiez/data/models/product.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable{
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  num get totalPrice {
    return products.fold(0, (total, current) => total + current.price);
  }

  @override
  List<Object?> get props => [products];
}