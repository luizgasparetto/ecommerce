import 'package:ecommerce/app/presentation/blocs/credit_card_bloc/credit_card_bloc.dart';
import 'exports/exports.dart';
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
        BlocProvider<AuthBloc>(create: (context) => GetIt.I.get<AuthBloc>()),
        BlocProvider<CartBloc>(create: (context) => GetIt.I.get<CartBloc>()),
        BlocProvider<CreditCardBloc>(
          create: (context) => GetIt.I.get<CreditCardBloc>(),
        )
      ],
      child: MaterialApp(
        title: 'Ecommerce',
        debugShowCheckedModeBanner: false,
        theme: MainTheme.theme(),
        routes: {
          '/home': (context) => const HomePage(),
          '/product_details': (context) => const ProductDetailsPage(),
          '/usr': (context) => const UserMainPage(),
          '/cart': (context) => const CartPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
        },
        home: GetIt.I.get<AuthRepository>().getLandingPage(context),
      ),
    );
  }
}
