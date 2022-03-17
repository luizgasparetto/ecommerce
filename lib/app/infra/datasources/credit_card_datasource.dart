abstract class CreditCardDatasource {
  Future<List<Map<String, dynamic>>> getCreditCards();
  Future<void> addCreditCard(Map<String, dynamic> creditCard);
  Future<void> removeCreditCard(Map<String, dynamic> creditCard);
}
