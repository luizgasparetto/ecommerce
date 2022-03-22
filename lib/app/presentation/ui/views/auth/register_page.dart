import 'package:ecommerce/core/exports/exports.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final ValueNotifier _nameNotifier = ValueNotifier("");
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
                padding:
                    EdgeInsets.only(left: width * 0.03, top: height * 0.20),
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
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        prefixIcon: const Icon(IconlyLight.user),
                        hintText: 'Full Name',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) => _nameNotifier.value = value,
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
                          name: _nameNotifier.value,
                          email: _emailNotifier.value,
                          password: _passwordNotifier.value,
                          context: context,
                        ),
                      );
                    }),
              ),
              SizedBox(height: height * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    child: const Text('Sign In!'),
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, '/login'),
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
