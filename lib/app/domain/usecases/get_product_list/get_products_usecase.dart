import 'package:ecommerce/app/domain/entities/product_entity.dart';

abstract class GetProductsUsecase {
  Future<List<ProductEntity>> getProducts();
}
