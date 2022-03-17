part of 'credit_card_bloc.dart';

abstract class CreditCardEvent extends Equatable {
  const CreditCardEvent();

  @override
  List<Object> get props => [];
}

class GetCreditCardsEvent extends CreditCardEvent {}

class AddCreditCardEvent extends CreditCardEvent {
  final String fullName;
  final String cardNumber;
  final String expirationDate;
  final String cvvCode;

  const AddCreditCardEvent({
    required this.fullName,
    required this.cardNumber,
    required this.expirationDate,
    required this.cvvCode,
  });

  @override
  List<Object> get props => [fullName, cardNumber, expirationDate, cvvCode];
}

class RemoveCreditCardEvent extends CreditCardEvent {
  final CreditCardEntity creditCard;

  const RemoveCreditCardEvent({required this.creditCard});

  @override
  List<Object> get props => [creditCard];
}
