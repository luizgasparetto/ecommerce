class ProductEntity {
  final String name;
  final double value;
  final List<String> imgUrls;
  final bool favorite;
  final String tag;
  final String size;

  ProductEntity({
    required this.name,
    required this.value,
    required this.imgUrls,
    required this.favorite,
    required this.tag,
    required this.size,
  });
}
