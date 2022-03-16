part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddCartItemEvent extends CartEvent {
  final ProductEntity product;

  const AddCartItemEvent(this.product);

  @override
  List<Object> get props => [product];
}

class GetCartItensEvent extends CartEvent {}
