import 'package:cartiez/bloc/progress_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../data/models/product.dart';
import '../data/services/network/api_service.dart';

final productsBloc = ProductsListBloc();

class ProductsListBloc with ChangeNotifier{

  // Network object instance
  final ApiService _apiService = ApiService();
  Progress result = Progress.FAILED;

  // Observable subject
  final BehaviorSubject<List<Product>> _behaviorSubject = BehaviorSubject<List<Product>>();

  // This function gets the products from the data repository asynchronously,
  // then sets the response returned from the operation to the observable object's
  // sink
  Future getProducts () async {
    await _apiService.fetchProducts().then((response) {
      result = Progress.SUCCESS;
      this._behaviorSubject.sink.add(response);
    });
  }

  // Getter for the stream of the observable, which will be accessed by the UI layer.
  get allProducts => _behaviorSubject.stream;

  @mustCallSuper
  dispose (){
    _behaviorSubject.close();
  }
  BehaviorSubject<List<Product>> get subject => _behaviorSubject;
}
