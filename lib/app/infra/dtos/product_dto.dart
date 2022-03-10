// ignore_for_file: annotate_overrides, overridden_fields

import 'package:ecommerce/app/domain/entities/product_entity.dart';

class ProductDTO extends ProductEntity {
  final String name;
  final double value;
  final List<String> imgUrls;
  final bool favorite;

  ProductDTO({
    required this.name,
    required this.value,
    required this.imgUrls,
    required this.favorite,
  }) : super(name: name, value: value, imgUrls: imgUrls, favorite: favorite);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
      'imgUrls': imgUrls,
      'favorite': favorite
    };
  }

  factory ProductDTO.fromMap(Map<String, dynamic> map) {
    return ProductDTO(
      name: map['name'] ?? '',
      value: map['value']?.toDouble() ?? 0.0,
      imgUrls: List<String>.from(map['imgUrls']),
      favorite: map['favorite'],
    );
  }
}
