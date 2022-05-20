part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class LoadProductsEvent extends ProductsEvent {
  @override
  List<Object?> get props => [];
}

class NoInternetEvent extends ProductsEvent {
  @override
  List<Object?> get props => [];
}