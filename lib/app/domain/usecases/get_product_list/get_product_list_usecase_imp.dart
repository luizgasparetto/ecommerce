import 'package:ecommerce/app/domain/entities/product_entity.dart';
import 'package:ecommerce/app/domain/repositories/get_products_repository.dart';
import 'package:ecommerce/app/domain/usecases/get_product_list/get_product_list_usecase.dart';

class GetProductListUsecaseImp implements GetProductListUsecase {
  final GetProductListRepository _getProductListRepository;

  GetProductListUsecaseImp(this._getProductListRepository);

  @override
  Future<List<ProductEntity>> handle() async {
    return await _getProductListRepository.getProductList();
  }
}
