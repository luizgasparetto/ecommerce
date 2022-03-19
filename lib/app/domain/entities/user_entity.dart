class UserEntity {
  final String name;
  final String email;
  final List<dynamic> cartItems;
  final List<dynamic> creditCards;

  UserEntity({
    required this.name,
    required this.email,
    required this.cartItems,
    required this.creditCards,
  });
}
