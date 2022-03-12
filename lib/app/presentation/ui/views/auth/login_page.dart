import 'package:ecommerce/app/presentation/blocs/auth_user_bloc/auth_user_bloc.dart';
import 'package:ecommerce/app/presentation/ui/widgets/custom_text_field_basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    final bloc = GetIt.I.get<AuthUserBloc>();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * 0.03, top: height * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: MediaQuery.of(context).textScaleFactor * 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "We're happy to see you again!",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: MediaQuery.of(context).textScaleFactor * 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.015),
              child: Column(
                children: [
                  SizedBox(height: height * 0.05),
                  CustomTextFieldBasic(
                    hintText: 'E-mail',
                    icon: MaterialCommunityIcons.email,
                    textInputType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  SizedBox(height: height * 0.015),
                  CustomTextFieldBasic(
                    hintText: 'Password',
                    icon: Icons.password,
                    obscureText: true,
                    controller: _passwordController,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.05),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).textScaleFactor * 20,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColorDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  bloc.add(AuthLoginUserEvent(
                      _emailController.text, _passwordController.text));
                },
              ),
            ),
            SizedBox(height: height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  child: const Text('Sign Up!'),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
