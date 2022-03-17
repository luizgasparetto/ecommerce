import 'package:ecommerce/app/domain/entities/credit_card_entity.dart';
import 'package:ecommerce/app/domain/repositories/credit_card_repository.dart';
import 'package:ecommerce/app/domain/usecases/credit_card_usecase/credit_card_usecase.dart';

class CreditCardUsecaseImp implements CreditCardUsecase {
  final CreditCardRepository _creditCardRepository;

  CreditCardUsecaseImp(this._creditCardRepository);

  @override
  Future<void> addCreditCard(CreditCardEntity creditCard) async {
    await _creditCardRepository.addCreditCard(creditCard);
  }

  @override
  Future<void> removeCreditCard(CreditCardEntity creditCard) async {
    await _creditCardRepository.removeCreditCard(creditCard);
  }

  @override
  Future<List<CreditCardEntity>> getCreditCards() async {
    return await _creditCardRepository.getCreditCards();
  }
}
