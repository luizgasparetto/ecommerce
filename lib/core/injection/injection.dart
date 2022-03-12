import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/app/domain/repositories/get_products_repository.dart';
import 'package:ecommerce/app/domain/usecases/get_product_list/get_product_list_usecase.dart';
import 'package:ecommerce/app/domain/usecases/get_product_list/get_product_list_usecase_imp.dart';
import 'package:ecommerce/app/external/datasources/get_product_list/get_product_list_datasource_firestore_imp.dart';
import 'package:ecommerce/app/infra/datasources/get_products_datasource.dart';
import 'package:ecommerce/app/infra/repositories/get_products_repository_imp.dart';
import 'package:ecommerce/app/presentation/blocs/get_product_list_bloc/get_product_list_bloc.dart';

import 'package:ecommerce/app/presentation/controllers/get_products_controller.dart';
import 'package:get_it/get_it.dart';

class Injection {
  static void inject() {
    final getIt = GetIt.instance;

    //datasources
    getIt.registerLazySingleton<GetProductsDataSource>(
        () => GetProductListDatasourceFirestoreImp(FirebaseFirestore.instance));
    //repositories
    getIt.registerLazySingleton<GetProductListRepository>(
        () => GetProductListRepositoryImp(getIt()));
    //usecases
    getIt.registerLazySingleton<GetProductListUsecase>(
        () => GetProductListUsecaseImp(getIt()));
    //controllers

    getIt.registerSingleton<GetProductsController>(
      GetProductsController(getIt()),
    );

    //blocs
    getIt.registerSingleton<GetProductListBloc>(
      GetProductListBloc(getIt()),
    );
  }
}
