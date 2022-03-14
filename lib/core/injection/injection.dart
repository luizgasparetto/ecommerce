import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/app/domain/repositories/auth_repository.dart';
import 'package:ecommerce/app/domain/repositories/get_products_repository.dart';
import 'package:ecommerce/app/domain/repositories/user_repository.dart';
import 'package:ecommerce/app/domain/usecases/get_product_list/get_product_list_usecase.dart';
import 'package:ecommerce/app/domain/usecases/get_product_list/get_product_list_usecase_imp.dart';
import 'package:ecommerce/app/domain/usecases/user_usecase/user_usecase.dart';
import 'package:ecommerce/app/domain/usecases/user_usecase/user_usecase_imp.dart';
import 'package:ecommerce/app/external/datasources/get_product_list_datasource/get_product_list_datasource_firestore_imp.dart';
import 'package:ecommerce/app/external/datasources/user_datasource/user_datasource_imp.dart';
import 'package:ecommerce/app/infra/datasources/get_products_datasource.dart';
import 'package:ecommerce/app/infra/datasources/user_datasource.dart';
import 'package:ecommerce/app/infra/repositories/auth_repository_imp.dart';
import 'package:ecommerce/app/infra/repositories/get_products_repository_imp.dart';
import 'package:ecommerce/app/infra/repositories/user_repository_imp.dart';
import 'package:ecommerce/app/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:ecommerce/app/presentation/blocs/get_product_list_bloc/get_product_list_bloc.dart';

import 'package:ecommerce/app/presentation/controllers/get_products_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class Injection {
  static void inject() {
    final getIt = GetIt.instance;

    //datasources
    getIt.registerLazySingleton<GetProductsDataSource>(
        () => GetProductListDatasourceFirestoreImp(FirebaseFirestore.instance));

    getIt.registerLazySingleton<UserDatasource>(
      () => UserDatasourceImp(
          firebaseFirestore: FirebaseFirestore.instance,
          firebaseAuth: FirebaseAuth.instance),
    );

    // services
    //repositories
    getIt.registerLazySingleton<GetProductListRepository>(
        () => GetProductListRepositoryImp(getIt()));

    getIt.registerLazySingleton<UserRepository>(
        () => UserRepositoryImp(getIt()));

    getIt.registerFactory<AuthRepository>(
        () => AuthRepositoryImp(FirebaseAuth.instance));

    //usecases
    getIt.registerLazySingleton<GetProductListUsecase>(
        () => GetProductListUsecaseImp(getIt()));

    getIt.registerLazySingleton<UserUsecase>(
        () => UserUsecaseImp(userRepository: getIt()));

    //controllers
    getIt.registerSingleton<GetProductsController>(
      GetProductsController(getIt()),
    );
    //Routes
    //blocs
    getIt.registerSingleton<GetProductListBloc>(
      GetProductListBloc(getIt()),
    );

    getIt.registerSingleton<AuthBloc>(AuthBloc(getIt(), getIt()));

    // Route
  }
}
