import 'package:ecommerce/app/domain/entities/product_entity.dart';

abstract class GetProductsRepository {
  Future<List<ProductEntity>> getProducts();
}
