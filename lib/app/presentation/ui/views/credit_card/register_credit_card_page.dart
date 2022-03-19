import 'package:ecommerce/app/presentation/ui/widgets/credit_card/register_credit_card_field.dart';
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
                  color: const Color.fromARGB(255, 31, 29, 29),
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
                    RegisterCreditCardField(
                      labelText: 'Name',
                      hintText: 'Jaime Scott',
                      icon: IconlyBold.profile,
                      controller: _fullNameController,
                      validatorFunction: (value) {
                        return null;
                      },
                      onChangedFunction: (text) {},
                      onTapFunction: () {},
                    ),
                    RegisterCreditCardField(
                      labelText: 'Card Number',
                      hintText: '1111 1111 1111 1111',
                      icon: MaterialCommunityIcons.credit_card,
                      controller: _cardNumberController,
                      validatorFunction: (value) {
                        return null;
                      },
                      onChangedFunction: (text) {},
                      onTapFunction: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RegisterCreditCardField(
                          labelText: 'Expiration Date',
                          hintText: '09/24',
                          icon: IconlyBold.calendar,
                          controller: _fullNameController,
                          width: width * 0.45,
                          validatorFunction: (value) {
                            return null;
                          },
                          onChangedFunction: (text) {},
                          onTapFunction: () {},
                        ),
                        RegisterCreditCardField(
                          labelText: 'CVV Code',
                          hintText: '091',
                          icon: IconlyBold.password,
                          controller: _fullNameController,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          width: width * 0.45,
                          validatorFunction: (value) {
                            return null;
                          },
                          onChangedFunction: (text) {},
                          onTapFunction: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.03),
                    CustomElevatedButton(
                      width: double.infinity,
                      buttonTitle: 'Register',
                      paddingValue: 16,
                      onPressedFunction: () {},
                    )
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
