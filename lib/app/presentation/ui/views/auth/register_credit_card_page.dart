import 'package:ecommerce/core/exports/exports.dart';

class RegisterCreditCardPage extends StatefulWidget {
  const RegisterCreditCardPage({Key? key}) : super(key: key);

  @override
  State<RegisterCreditCardPage> createState() => _RegisterCreditCardPageState();
}

class _RegisterCreditCardPageState extends State<RegisterCreditCardPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _fullNameController;
  late TextEditingController _cardNumberController;
  late TextEditingController _expirationCodeController;
  late TextEditingController _cvvCodeController;

  @override
  void initState() {
    _fullNameController = TextEditingController();
    _cardNumberController = TextEditingController();
    _expirationCodeController = TextEditingController();
    _cvvCodeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: height * 0.25,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: const [],
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: width * 0.02,
                        bottom: height * 0.01,
                      ),
                      child: const Text(
                        'Card Number',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        prefixIcon:
                            const Icon(MaterialCommunityIcons.credit_card),
                        hintText: '1111 1111 1111 1111',
                      ),
                      validator: (value) {
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
