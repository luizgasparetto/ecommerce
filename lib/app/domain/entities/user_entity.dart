class UserEntity {
  final String name;
  final String email;
  final List<dynamic> cartProducts;
  final List<dynamic> creditCards;

  UserEntity({
    required this.name,
    required this.email,
    required this.cartProducts,
    required this.creditCards,
  });
}
