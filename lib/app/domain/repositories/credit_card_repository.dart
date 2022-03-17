import 'package:ecommerce/app/domain/entities/credit_card_entity.dart';

abstract class CreditCardRepository {
  Future<void> addCreditCard(CreditCardEntity creditCard);
  Future<void> removeCreditCard(CreditCardEntity creditCard);
  Future<List<CreditCardEntity>> getCreditCards();
}
