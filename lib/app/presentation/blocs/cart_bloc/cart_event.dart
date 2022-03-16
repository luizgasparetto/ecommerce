part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddProductInCartEvent extends CartEvent {
  final ProductEntity product;

  const AddProductInCartEvent(this.product);

  @override
  List<Object> get props => [product];
}

class GetCartProductsEvent extends CartEvent {}

class DeleteCartProductEvent extends CartEvent {
  final ProductEntity product;

  const DeleteCartProductEvent(this.product);

  @override
  List<Object> get props => [product];
}
