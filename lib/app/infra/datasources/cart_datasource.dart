abstract class CartDatasource {
  Future<List<dynamic>> getCartItems();
  Future<void> addCartItem(Map<String, dynamic> product);
  Future<void> deleteCartItem(Map<String, dynamic> product);
}
