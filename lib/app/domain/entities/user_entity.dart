import 'package:ecommerce/app/domain/entities/product_entity.dart';

class UserEntity {
  final String name;
  final String email;
  final List<ProductEntity> cartItems;

  UserEntity({
    required this.name,
    required this.email,
    required this.cartItems,
  });
}
