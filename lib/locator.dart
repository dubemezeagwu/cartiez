import 'package:cartiez/data/repository/cart_repository.dart';
import 'package:cartiez/data/services/network/products_api.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance();

// Setup locator method
void setupLocator (){
  // locator.registerLazySingleton<ProductsAPI>(() => ProductsAPI());
  locator.registerLazySingleton<CartRepository>(() => CartRepository());
}