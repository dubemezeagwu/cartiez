import 'package:cartiez/data/models/product.dart';

class CartRepository {

  final _delay = Duration(milliseconds: 800);
  final List<Product> _products = <Product>[];

  Future<List<Product>> loadCartItems() => Future.delayed(_delay, () => _products);

  void addItemToCart(Product product) => _products.add(product);

  void removeItemFromCart(Product product) => _products.remove(product);
}