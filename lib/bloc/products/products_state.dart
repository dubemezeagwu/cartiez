part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class ProductsLoadingState extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsLoadedState extends ProductsState {
  final Product product;

  ProductsLoadedState(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductsLoadingErrorState extends ProductsState {
  @override
  List<Object?> get props => [];

}