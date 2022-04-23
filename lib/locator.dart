import 'package:cartiez/data/repository/cart_repository.dart';
import 'package:cartiez/data/services/network/api_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance();

// Setup locator method
void setupLocator (){
  locator.registerLazySingleton<ApiService>(() => ApiService());
}