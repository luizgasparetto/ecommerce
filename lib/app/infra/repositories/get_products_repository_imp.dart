import 'package:ecommerce/app/domain/repositories/get_products_repository.dart';
import 'package:ecommerce/app/infra/datasources/get_products_datasource.dart';
import 'dart:developer' as dev;

import '../dtos/product_dto.dart';

class GetProductListRepositoryImp implements GetProductListRepository {
  final GetProductsDataSource _getProductsDataSource;

  GetProductListRepositoryImp(this._getProductsDataSource);

  @override
  Future<List<ProductDTO>> getProductList() async {
    final fireStoreProductListSnapshot =
        await _getProductsDataSource.getProductList();

    return fireStoreProductListSnapshot.docs.map((product) {
      dev.log(product.data().toString());
      return ProductDTO.fromMap(product.data());
    }).toList();
  }
}
