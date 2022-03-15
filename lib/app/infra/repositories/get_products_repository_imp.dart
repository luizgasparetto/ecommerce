import 'package:ecommerce/app/domain/entities/product_entity.dart';
import 'package:ecommerce/app/domain/repositories/get_products_repository.dart';
import 'package:ecommerce/app/infra/datasources/get_products_datasource.dart';

import '../dtos/product_dto.dart';

class GetProductListRepositoryImp implements GetProductListRepository {
  final GetProductsDataSource _getProductsDataSource;

  GetProductListRepositoryImp(this._getProductsDataSource);

  @override
  Future<List<ProductEntity>> getProductList() async {
    final fireStoreProductListSnapshot =
        await _getProductsDataSource.getProductList();

    return fireStoreProductListSnapshot.docs.map((product) {
      return ProductDTO.fromMap(product.data());
    }).toList();
  }
}
