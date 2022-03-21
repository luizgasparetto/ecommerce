import 'package:ecommerce/app/domain/repositories/cart_repository.dart';
import 'package:ecommerce/app/domain/usecases/cart_usecase/cart_usecase.dart';
import 'package:ecommerce/app/infra/exceptions/cart_exceptions.dart';

import '../../entities/product_entity.dart';

class CartUsecaseImp implements CartUsecase {
  final CartRepository _cartRepository;

  CartUsecaseImp(this._cartRepository);

  @override
  Future<List<ProductEntity>> getCartProducts() async {
    return await _cartRepository.getCartProducts();
  }

  @override
  Future<void> addCartItem(ProductEntity product) async {
    final cartProducts = await _cartRepository.getCartProducts();

    if (cartProducts.contains(product)) {
      throw CartException.fromCode('product-in-cart');
    }

    await _cartRepository.addCartItem(product);
  }

  @override
  Future<void> deleteCartItem(ProductEntity product) async {
    await _cartRepository.deleteCartItem(product);
  }

  @override
  Future<double> getCartTotalValue() async {
    final cartProductList = await _cartRepository.getCartProducts();
    double total = 0.0;

    for (var product in cartProductList) {
      total += product.value;
    }

    return total;
  }
}
