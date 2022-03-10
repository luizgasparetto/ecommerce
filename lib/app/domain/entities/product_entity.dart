class ProductEntity {
  final String name;
  final double value;
  final List<String> imgUrls;
  final bool favorite;

  ProductEntity({
    required this.name,
    required this.value,
    required this.imgUrls,
    required this.favorite,
  });
}
