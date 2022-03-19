import 'package:ecommerce/core/exports/exports.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'E-mail',
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
                    authBloc.add(
                      SignInEvent(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ),
                    );
                  }),
            ),
            SizedBox(height: height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  child: const Text('Sign Up!'),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/register');
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
