import 'package:ecommerce/app/presentation/blocs/auth_user_bloc/auth_user_bloc.dart';
import 'package:ecommerce/app/presentation/blocs/get_product_list_bloc/get_product_list_bloc.dart';
import 'package:ecommerce/app/presentation/ui/views/auth/login_page.dart';
import 'package:ecommerce/app/presentation/ui/views/auth/register_page.dart';
import 'package:ecommerce/app/presentation/ui/views/product_details_page.dart';
import 'package:ecommerce/core/routes/auth_route.dart';
import 'package:ecommerce/core/themes/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../app/presentation/ui/views/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetProductListBloc>(
          create: (context) => GetIt.I.get<GetProductListBloc>()
            ..add(const FetchProductListBySearchBarEvent()),
        ),
        BlocProvider<AuthUserBloc>(
          create: (context) => GetIt.I.get<AuthUserBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Ecommerce',
        debugShowCheckedModeBanner: false,
        theme: MainTheme.theme(),
        routes: {
          '/home': (context) => const HomePage(),
          '/product_details': (context) => const ProductDetailsPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
        },
        initialRoute: GetIt.I.get<AuthRoute>().authCheck(),
      ),
    );
  }
}
