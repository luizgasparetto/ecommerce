import 'package:ecommerce/app/domain/entities/product_entity.dart';
import 'package:ecommerce/app/domain/repositories/get_products_repository.dart';
import 'package:ecommerce/app/domain/usecases/get_product_list/get_products_usecase.dart';

class GetProductsUsecaseImp implements GetProductsUsecase {
  final GetProductsRepository _getProductsRepository;

  GetProductsUsecaseImp(this._getProductsRepository);

  @override
  Future<List<ProductEntity>> getProducts() async {
    return await _getProductsRepository.getProducts();
  }
}
