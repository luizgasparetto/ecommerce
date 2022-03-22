import 'package:ecommerce/app/domain/entities/product_entity.dart';
import 'package:ecommerce/core/exports/exports.dart';

class GetProductsController {
  final GetProductsUsecase _getProductListUsecase;

  GetProductsController(this._getProductListUsecase);

  Future<List<ProductEntity?>> filterByTag(String? tag) async {
    final productList = await _getProductListUsecase.getProducts();
    List<ProductEntity> productListWithTag = [];

    if (tag == null) return productList;

    for (var product in productList) {
      if (product.tag.contains(tag.toLowerCase())) {
        productListWithTag.add(product);
      }
    }

    return productListWithTag;
  }

  Future<List<ProductEntity?>> filterBySearchBar(String? text) async {
    final productList = await _getProductListUsecase.getProducts();
    List<ProductEntity> productListWithSearchBar = [];

    if (text == null) return productList;

    for (var product in productList) {
      if (product.name.toLowerCase().contains(text.toLowerCase())) {
        productListWithSearchBar.add(product);
      }
    }

    return productListWithSearchBar;
  }
}
