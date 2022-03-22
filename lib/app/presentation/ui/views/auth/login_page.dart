import 'package:ecommerce/app/infra/exceptions/sign_in_exception.dart';
import 'package:ecommerce/app/presentation/ui/widgets/custom_change_password_bottom_sheet.dart';
import 'package:ecommerce/core/exports/exports.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final ValueNotifier _emailNotifier = ValueNotifier("");
  final ValueNotifier _passwordNotifier = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final authBloc = context.read<AuthBloc>();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.03,
                  top: height * 0.22,
                ),
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
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        prefixIcon: const Icon(MaterialCommunityIcons.at),
                        hintText: 'E-mail',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => _emailNotifier.value = value,
                    ),
                    SizedBox(height: height * 0.015),
                    TextField(
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
                      onChanged: (value) => _passwordNotifier.value = value,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: const Text('Forgot your password?'),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            builder: (context) {
                              return const CustomResetPasswordBottomSheet();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.01),
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
                    try {
                      authBloc.add(SignInEvent(
                        email: _emailNotifier.value,
                        password: _passwordNotifier.value,
                        context: context,
                      ));
                    } on SignInException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(e.errorMessage),
                      ));
                    }
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
