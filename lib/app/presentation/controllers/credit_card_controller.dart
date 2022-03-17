import 'package:ecommerce/app/domain/entities/credit_card_entity.dart';
import 'package:ecommerce/app/domain/usecases/credit_card_usecase/credit_card_usecase.dart';

class CreditCardController {
  final CreditCardUsecase _creditCardUsecase;

  CreditCardController(this._creditCardUsecase);

  Future<void> addCreditCard({
    required String fullName,
    required String cardNumber,
    required String expirationDate,
    required String cvvCode,
  }) async {
    final creditCard = CreditCardEntity(
      fullName: fullName,
      cardNumber: cardNumber,
      expirationDate: expirationDate,
      cvvCode: cvvCode,
    );

    await _creditCardUsecase.addCreditCard(creditCard);
  }

  Future<void> removeCreditCard(CreditCardEntity creditCard) async {
    await _creditCardUsecase.removeCreditCard(creditCard);
  }

  Future<List<CreditCardEntity>> getCreditCards() async {
    return await _creditCardUsecase.getCreditCards();
  }
}
