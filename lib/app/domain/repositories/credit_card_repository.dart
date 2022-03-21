import 'package:ecommerce/app/domain/entities/credit_card_entity.dart';

abstract class CreditCardRepository {
  Future<List<CreditCardEntity>> getCreditCards();
  Future<void> addCreditCard(CreditCardEntity creditCard);
  Future<void> removeCreditCard(CreditCardEntity creditCard);
}
