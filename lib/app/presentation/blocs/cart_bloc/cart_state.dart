part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartState {}

class CartProductsLoadedState extends CartState {
  final List<ProductEntity> cartProducts;

  const CartProductsLoadedState(this.cartProducts);

  @override
  List<Object> get props => [cartProducts];
}

class CartEmptyState extends CartState {}

class CartErrorState extends CartState {}
