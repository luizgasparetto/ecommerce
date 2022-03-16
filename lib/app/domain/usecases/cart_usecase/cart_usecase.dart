import '../../entities/product_entity.dart';

abstract class CartUsecase {
  Future<List<ProductEntity>> getCartProducts();
  Future<void> addCartItem(ProductEntity product);
  Future<void> deleteCartItem(ProductEntity product);
  Future<double> getCartTotalValue();
}
