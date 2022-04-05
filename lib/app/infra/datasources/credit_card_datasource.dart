abstract class CreditCardDatasource {
  Future<List<dynamic>> getCreditCards();
  Future<void> addCreditCard(Map<String, dynamic> creditCard);
  Future<void> removeCreditCard(Map<String, dynamic> creditCard);
}
