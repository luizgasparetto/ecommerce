import 'package:ecommerce/app/domain/repositories/credit_card_repository.dart';
import 'package:ecommerce/app/domain/usecases/auth_usecase/auth_usecase.dart';
import 'package:ecommerce/app/domain/usecases/auth_usecase/auth_usecase_imp.dart';
import 'package:ecommerce/app/domain/usecases/credit_card_usecase/credit_card_usecase.dart';
import 'package:ecommerce/app/domain/usecases/credit_card_usecase/credit_card_usecase_imp.dart';
import 'package:ecommerce/app/domain/usecases/get_product_list/get_products_usecase.dart';
import 'package:ecommerce/app/domain/usecases/get_product_list/get_products_usecase_imp.dart';
import 'package:ecommerce/app/external/datasources/cart_datasource_imp.dart';
import 'package:ecommerce/app/external/datasources/credit_card_datasource_imp.dart';
import 'package:ecommerce/app/infra/datasources/cart_datasource.dart';
import 'package:ecommerce/app/infra/datasources/credit_card_datasource.dart';
import 'package:ecommerce/app/infra/repositories/credit_card_repository_imp.dart';
import 'package:ecommerce/app/presentation/blocs/credit_card_bloc/credit_card_bloc.dart';
import 'package:ecommerce/app/presentation/controllers/credit_card_controller.dart';
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
        firebaseAuth: FirebaseAuth.instance,
      ),
    );

    getIt.registerLazySingleton<CartDatasource>(
      () => CartDatasourceImp(
        firebaseFirestore: FirebaseFirestore.instance,
        firebaseAuth: FirebaseAuth.instance,
      ),
    );

    getIt.registerLazySingleton<CreditCardDatasource>(
      () => CreditCardDatasourceImp(
        firebaseFirestore: FirebaseFirestore.instance,
        firebaseAuth: FirebaseAuth.instance,
      ),
    );

    //repositories
    getIt.registerLazySingleton<GetProductsRepository>(
        () => GetProductsRepositoryImp(getIt()));

    getIt.registerLazySingleton<UserRepository>(
        () => UserRepositoryImp(getIt()));

    getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImp(FirebaseAuth.instance));

    getIt.registerLazySingleton<CartRepository>(
        () => CartRepositoryImp(getIt()));

    getIt.registerLazySingleton<CreditCardRepository>(
        () => CreditCardRepositoryImp(getIt()));

    //usecases
    getIt.registerLazySingleton<GetProductsUsecase>(
        () => GetProductsUsecaseImp(getIt()));

    getIt.registerLazySingleton<UserUsecase>(
        () => UserUsecaseImp(userRepository: getIt()));

    getIt.registerLazySingleton<CartUsecase>(() => CartUsecaseImp(getIt()));

    getIt.registerLazySingleton<CreditCardUsecase>(
        () => CreditCardUsecaseImp(getIt()));

    getIt.registerLazySingleton<AuthUsecase>(() => AuthUsecaseImp(getIt()));

    //controllers
    getIt.registerSingleton<GetProductsController>(
      GetProductsController(getIt()),
    );

    getIt.registerSingleton<CreditCardController>(
      CreditCardController(getIt()),
    );

    //blocs
    getIt.registerSingleton<GetProductListBloc>(
      GetProductListBloc(getIt()),
    );

    getIt.registerSingleton<AuthBloc>(AuthBloc(getIt(), getIt()));

    getIt.registerSingleton<CartBloc>(CartBloc(getIt()));

    getIt.registerSingleton<CreditCardBloc>(CreditCardBloc(getIt()));
  }
}
