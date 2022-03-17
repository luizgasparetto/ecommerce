class CreditCardEntity {
  final String fullName;
  final String cardNumber;
  final String expirationDate;
  final String cvvCode;

  CreditCardEntity({
    required this.fullName,
    required this.cardNumber,
    required this.expirationDate,
    required this.cvvCode,
  });
}
