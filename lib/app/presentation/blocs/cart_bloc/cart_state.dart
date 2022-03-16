part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartState {}

class CartProductsLoadedState extends CartState {
  final List<ProductEntity> cartProducts;
  final double totalValue;

  const CartProductsLoadedState(this.cartProducts, this.totalValue);

  @override
  List<Object> get props => [cartProducts, totalValue];
}

class CartEmptyState extends CartState {}

class CartErrorState extends CartState {
  final String errorMessage;

  const CartErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
