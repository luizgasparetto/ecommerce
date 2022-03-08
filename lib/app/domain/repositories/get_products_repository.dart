import 'package:ecommerce/app/domain/entities/product_entity.dart';

abstract class GetProductListRepository {
  Future<List<ProductEntity>> getProductList();
}
