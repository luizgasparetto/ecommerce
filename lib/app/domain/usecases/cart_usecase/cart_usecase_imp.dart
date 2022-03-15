import 'package:ecommerce/app/domain/repositories/cart_repository.dart';
import 'package:ecommerce/app/domain/usecases/cart_usecase/cart_usecase.dart';

import '../../entities/product_entity.dart';

class CartUsecaseImp implements CartUsecase {
  final CartRepository _cartRepository;

  CartUsecaseImp(this._cartRepository);

  Future<List<ProductEntity>> getCartProducts() async {
    return await _cartRepository.getCartProducts();
  }

  Future<void> addCartItem(ProductEntity product) async {
    await _cartRepository.addCartItem(product);
  }
}
