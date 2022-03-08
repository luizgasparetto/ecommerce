import 'package:ecommerce/app/domain/entities/product_entity.dart';

abstract class GetProductListUsecase {
  Future<List<ProductEntity>> handle();
}
