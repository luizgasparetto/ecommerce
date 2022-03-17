// ignore_for_file: overridden_fields, annotate_overrides

import 'package:ecommerce/app/domain/entities/credit_card_entity.dart';

class CreditCardDTO extends CreditCardEntity {
  final String fullName;
  final String cardNumber;
  final String expirationDate;
  final String cvvCode;

  CreditCardDTO(
      {required this.fullName,
      required this.cardNumber,
      required this.expirationDate,
      required this.cvvCode})
      : super(
          fullName: fullName,
          cardNumber: cardNumber,
          expirationDate: expirationDate,
          cvvCode: cvvCode,
        );

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'cardNumber': cardNumber,
      'expirationDate': expirationDate,
      'cvvCode': cvvCode,
    };
  }

  factory CreditCardDTO.fromJson(Map<String, dynamic> map) {
    return CreditCardDTO(
      fullName: map['fullName'] ?? '',
      cardNumber: map['cardNumber'] ?? '',
      expirationDate: map['expirationDate'] ?? '',
      cvvCode: map['cvvCode'] ?? '',
    );
  }
}
