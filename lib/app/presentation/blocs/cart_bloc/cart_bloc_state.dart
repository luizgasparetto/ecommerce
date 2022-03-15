part of 'cart_bloc_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartState {}

class CartItemsLoadedState extends CartState {
  final List<ProductEntity> cartProducts;

  const CartItemsLoadedState(this.cartProducts);

  @override
  List<Object> get props => [cartProducts];
}

class CartErrorState extends CartState {}
