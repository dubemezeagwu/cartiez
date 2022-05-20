import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cartiez/data/models/product.dart';
import 'package:cartiez/data/repository/network_repository.dart';
import 'package:cartiez/data/services/connectivity_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final NetworkRepository _networkRepository;
  final ConnectivityService _connectivityService = ConnectivityService();

  ProductsBloc(this._networkRepository) : super(ProductsLoadingState()) {
    _connectivityService.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        add(NoInternetEvent());
      } else {
        add(LoadProductsEvent());
      }
    });
    on<LoadProductsEvent>((event, emit) async {
      emit(ProductsLoadingState());
      final products = await _networkRepository.getProducts();
      emit(ProductsLoadedState(products));
    });

    on<NoInternetEvent>((event, emit){
      emit(ProductsLoadingErrorState());
    });
  }
}
