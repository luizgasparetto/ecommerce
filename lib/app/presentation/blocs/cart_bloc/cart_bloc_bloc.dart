import 'package:bloc/bloc.dart';
import 'package:ecommerce/app/domain/entities/product_entity.dart';
import 'package:ecommerce/app/domain/usecases/cart_usecase/cart_usecase.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as dev;

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartUsecase _cartUsecase;

  CartBloc(this._cartUsecase) : super(CartLoadingState()) {
    //
    on<GetCartItensEvent>((event, emit) async {
      try {
        final cartProducts = await _cartUsecase.getCartProducts();
        emit(CartItemsLoadedState(cartProducts));
      } catch (_) {
        emit(CartErrorState());
      }
    });

    on<AddCartItemEvent>((event, emit) async {
      try {
        await _cartUsecase.addCartItem(event.product);
      } catch (e, st) {
        emit(CartErrorState());
        dev.log('ERRO AO ADICIONAR O PRODUTO AO CARRINHO',
            error: e, stackTrace: st);
      }
    });
  }
}
