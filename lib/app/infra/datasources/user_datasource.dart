abstract class UserDatasource {
  Future<Map<String, dynamic>?> getUser();
  Future<void> setUserOnFirestore(Map<String, dynamic> data);
}
