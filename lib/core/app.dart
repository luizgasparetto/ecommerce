import 'package:ecommerce/app/presentation/blocs/credit_card_bloc/credit_card_bloc.dart';
import 'package:ecommerce/app/presentation/ui/views/credit_card/register_credit_card_page.dart';
import 'package:ecommerce/app/presentation/ui/views/credit_card/credit_cards_page.dart';
import 'package:ecommerce/app/presentation/ui/views/location_page.dart';
import 'exports/exports.dart';
import '../app/presentation/ui/views/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => GetIt.I.get<AuthBloc>()),
        BlocProvider<GetProductListBloc>(
          create: (context) => GetIt.I.get<GetProductListBloc>()
            ..add(const FetchProductListBySearchBarEvent()),
        ),
        BlocProvider<CartBloc>(create: (context) => GetIt.I.get<CartBloc>()),
        BlocProvider<CreditCardBloc>(
          create: (context) =>
              GetIt.I.get<CreditCardBloc>()..add(GetCreditCardsEvent()),
        )
      ],
      child: MaterialApp(
        title: 'Ecommerce',
        debugShowCheckedModeBanner: false,
        theme: MainTheme.theme(),
        routes: {
          '/home': (context) => const HomePage(),
          '/product_details': (context) => const ProductDetailsPage(),
          '/usr': (context) => const UserPage(),
          '/cart': (context) => const CartPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/credit_cards': (context) => const CreditCardsPage(),
          '/register_credit_cards': (context) => const RegisterCreditCardPage(),
          '/location': (context) => const LocationPage(),
        },
        home: GetIt.I.get<AuthRepository>().getLandingPage(context),
      ),
    );
  }
}
