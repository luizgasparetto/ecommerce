import 'package:ecommerce/app/domain/entities/product_entity.dart';
import 'package:ecommerce/app/domain/repositories/get_products_repository.dart';
import 'package:ecommerce/app/infra/datasources/get_products_datasource.dart';

import '../dtos/product_dto.dart';

class GetProductsRepositoryImp implements GetProductsRepository {
  final GetProductsDataSource _getProductsDataSource;

  GetProductsRepositoryImp(this._getProductsDataSource);

  @override
  Future<List<ProductEntity>> getProducts() async {
    final fireStoreProductsSnapshot =
        await _getProductsDataSource.getProductList();

    return fireStoreProductsSnapshot.docs.map((product) {
      return ProductDTO.fromMap(product.data());
    }).toList();
  }
}
