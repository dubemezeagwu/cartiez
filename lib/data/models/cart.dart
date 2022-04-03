import 'package:cartiez/data/models/product.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable{
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  @override
  // TODO: implement props
  List<Object?> get props => [products];
}