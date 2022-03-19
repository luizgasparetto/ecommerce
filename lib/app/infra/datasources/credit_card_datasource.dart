abstract class CreditCardDatasource {
  Future<List> getCreditCards();
  Future<void> addCreditCard(Map<String, dynamic> creditCard);
  Future<void> removeCreditCard(Map<String, dynamic> creditCard);
}
