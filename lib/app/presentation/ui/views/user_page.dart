import 'package:ecommerce/app/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            authBloc.add(LogoutEvent());
            Future.delayed(const Duration(milliseconds: 500), () {
              Navigator.pop(context);
            });
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
