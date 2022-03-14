import 'package:ecommerce/app/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:ecommerce/app/presentation/ui/views/auth/login_page.dart';
import 'package:ecommerce/app/presentation/ui/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AuthenticatedState) {
          return const HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
