abstract class UserDatasource {
  Future<Map<String, dynamic>?> getUser();
  Future<void> setUserOnFirestore(Map<String, dynamic> data);
  Future<List<dynamic>> getCartItems();
  Future<void> addCartItem(Map<String, dynamic> product);
  Future<void> deleteCartItem(Map<String, dynamic> product);
}
