import 'package:ecommerce/app/domain/entities/product_entity.dart';

abstract class UserDatasource {
  Future<Map<String, dynamic>?> getUser();
  Future<void> setUserOnFirestore(Map<String, dynamic> data);
  Future<List<dynamic>> getCartItems();
  Future<void> addCartItem(ProductEntity product);
}
