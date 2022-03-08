import 'package:ecommerce/app/presentation/blocs/get_product_list/get_product_list_bloc.dart';
import 'package:ecommerce/app/presentation/ui/home_page.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/themes/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetProductListBloc>(
          create: (context) =>
              GetIt.I.get<GetProductListBloc>()..add(FetchProductListEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Ecommerce',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGeneratedRoute,
        initialRoute: HomePage.routeName,
        theme: MainTheme.theme(),
      ),
    );
  }
}
