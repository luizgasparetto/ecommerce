import 'package:ecommerce/app/domain/entities/credit_card_entity.dart';
import 'package:ecommerce/app/domain/entities/product_entity.dart';

class UserEntity {
  final String name;
  final String email;
  final List<ProductEntity> cartItems;
  final List<CreditCardEntity> creditCards;

  UserEntity({
    required this.name,
    required this.email,
    required this.cartItems,
    required this.creditCards,
  });
}
