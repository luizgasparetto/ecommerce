abstract class AddressDatasource {
  Future<Map<String, dynamic>> getAddressFromCEP(String cep);
  Future<List<Map<String, dynamic>>> getAddressList();
  Future<void> registerAddress(Map<String, dynamic> address);
}
