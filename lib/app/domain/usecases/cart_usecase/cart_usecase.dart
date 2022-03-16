import '../../entities/product_entity.dart';

abstract class CartUsecase {
  Future<List<ProductEntity>> getCartProducts();
  Future<void> addCartItem(ProductEntity product);
}