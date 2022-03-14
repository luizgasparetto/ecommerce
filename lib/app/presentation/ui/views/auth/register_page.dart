import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../blocs/auth_bloc/auth_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final authBloc = context.read<AuthBloc>();

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
                    'Register',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: MediaQuery.of(context).textScaleFactor * 42,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Welcome to the new culture",
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
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      prefixIcon: const Icon(MaterialCommunityIcons.email),
                      hintText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: height * 0.015),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      prefixIcon: const Icon(Icons.password),
                      hintText: 'Password',
                    ),
                    obscureText: true,
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
                      'Register',
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
                    authBloc.add(
                      SignUpEvent(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.pop(context);
                    });
                  }),
            ),
            SizedBox(height: height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  child: const Text('Sign In!'),
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
