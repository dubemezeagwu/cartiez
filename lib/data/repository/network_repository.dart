import 'package:cartiez/data/services/authentication/authentication_service.dart';
import 'package:cartiez/data/services/network/products_api.dart';

class NetworkRepository {
  final productsAPI = ProductsAPI();

  Future getProducts() async => await productsAPI.fetchProducts();


}