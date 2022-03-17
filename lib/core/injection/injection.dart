import 'package:ecommerce/core/exports/exports.dart';

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

    //repositories
    getIt.registerLazySingleton<GetProductListRepository>(
        () => GetProductListRepositoryImp(getIt()));

    getIt.registerLazySingleton<UserRepository>(
        () => UserRepositoryImp(getIt()));

    getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImp(FirebaseAuth.instance));

    getIt.registerLazySingleton<CartRepository>(
        () => CartRepositoryImp(getIt()));

    //usecases
    getIt.registerLazySingleton<GetProductListUsecase>(
        () => GetProductListUsecaseImp(getIt()));

    getIt.registerLazySingleton<UserUsecase>(
        () => UserUsecaseImp(userRepository: getIt()));

    getIt.registerLazySingleton<CartUsecase>(() => CartUsecaseImp(getIt()));

    //controllers
    getIt.registerSingleton<GetProductsController>(
      GetProductsController(getIt()),
    );

    //blocs
    getIt.registerSingleton<GetProductListBloc>(
      GetProductListBloc(getIt()),
    );

    getIt.registerSingleton<AuthBloc>(AuthBloc(getIt(), getIt()));

    getIt.registerSingleton<CartBloc>(CartBloc(getIt()));
  }
}
