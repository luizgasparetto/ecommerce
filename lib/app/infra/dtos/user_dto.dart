// ignore_for_file: overridden_fields, annotate_overrides

import 'package:ecommerce/app/domain/entities/credit_card_entity.dart';
import 'package:ecommerce/app/domain/entities/product_entity.dart';
import 'package:ecommerce/app/domain/entities/user_entity.dart';

class UserDTO extends UserEntity {
  final String name;
  final String email;
  final List<dynamic> cartProducts;
  final List<dynamic> creditCards;

  UserDTO({
    required this.name,
    required this.email,
    required this.cartProducts,
    required this.creditCards,
  }) : super(
          name: name,
          email: email,
          cartProducts: cartProducts,
          creditCards: creditCards,
        );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'cartItems': cartProducts,
      'creditCards': creditCards
    };
  }

  factory UserDTO.fromMap(Map<String, dynamic>? map) {
    return UserDTO(
      name: map?['name'] ?? '',
      email: map?['email'] ?? '',
      cartProducts: map?['cartProducts'] ?? <ProductEntity>[],
      creditCards: map?['creditCards'] ?? <CreditCardEntity>[],
    );
  }
}
