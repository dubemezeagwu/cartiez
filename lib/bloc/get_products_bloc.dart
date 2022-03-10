import 'package:cartiez/models/product.dart';
import 'package:cartiez/services/network/api_service.dart';
import 'package:rxdart/rxdart.dart';

final productsBloc = ProductsListBloc();

class ProductsListBloc{
  final ApiService _apiService = ApiService();
  final BehaviorSubject<List<Product>> _behaviorSubject = BehaviorSubject<List<Product>>();

  getProducts () async {
    final response = await _apiService.fetchProducts();
    _behaviorSubject.sink.add(response);
  }

  dispose (){
    _behaviorSubject.close();
  }

  BehaviorSubject<List<Product>> get subject => _behaviorSubject;
}