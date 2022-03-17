import 'package:ecommerce/app/domain/entities/credit_card_entity.dart';
import 'package:ecommerce/app/domain/repositories/credit_card_repository.dart';
import 'package:ecommerce/app/infra/datasources/credit_card_datasource.dart';
import 'package:ecommerce/app/infra/dtos/credit_card_dto.dart';

class CreditCardRepositoryImp implements CreditCardRepository {
  final CreditCardDatasource _creditCardDatasource;

  CreditCardRepositoryImp(this._creditCardDatasource);

  @override
  Future<void> addCreditCard(CreditCardEntity creditCard) async {
    final creditCardDTO = CreditCardDTO(
      fullName: creditCard.fullName,
      cardNumber: creditCard.cardNumber,
      expirationDate: creditCard.expirationDate,
      cvvCode: creditCard.cvvCode,
    );

    await _creditCardDatasource.addCreditCard(creditCardDTO.toJson());
  }

  @override
  Future<void> removeCreditCard(CreditCardEntity creditCard) async {
    final creditCardDTO = CreditCardDTO(
      fullName: creditCard.fullName,
      cardNumber: creditCard.cardNumber,
      expirationDate: creditCard.expirationDate,
      cvvCode: creditCard.cvvCode,
    );

    await _creditCardDatasource.removeCreditCard(creditCardDTO.toJson());
  }

  @override
  Future<List<CreditCardEntity>> getCreditCards() async {
    final creditCardListJson = await _creditCardDatasource.getCreditCards();

    return creditCardListJson
        .map((card) => CreditCardDTO.fromJson(card))
        .toList();
  }
}
