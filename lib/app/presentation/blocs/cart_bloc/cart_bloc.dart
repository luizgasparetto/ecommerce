import 'package:bloc/bloc.dart';
import 'package:ecommerce/app/domain/entities/product_entity.dart';
import 'package:ecommerce/app/domain/usecases/cart_usecase/cart_usecase.dart';
import 'package:ecommerce/app/infra/exceptions/cart_exceptions.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartUsecase _cartUsecase;

  CartBloc(this._cartUsecase) : super(CartLoadingState()) {
    //
    on<GetCartProductsEvent>((event, emit) async {
      try {
        final cartProducts = await _cartUsecase.getCartProducts();
        final productsTotalValue = await _cartUsecase.getCartTotalValue();
        cartProducts.isEmpty
            ? emit(CartEmptyState())
            : emit(CartProductsLoadedState(cartProducts, productsTotalValue));
      } on CartException catch (e) {
        emit(CartErrorState(errorMessage: e.errorMessage));
      }
    });

    on<AddProductInCartEvent>((event, emit) async {
      try {
        await _cartUsecase.addCartItem(event.product);
      } on CartException catch (e) {
        emit(CartErrorState(errorMessage: e.errorMessage));
      }
    });

    on<DeleteCartProductEvent>((event, emit) async {
      try {
        await _cartUsecase.deleteCartItem(event.product);
      } catch (e) {
        throw CartException();
      }
    });
  }
}
