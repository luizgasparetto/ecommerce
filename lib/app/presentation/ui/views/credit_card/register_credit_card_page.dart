import 'package:ecommerce/app/presentation/blocs/credit_card_bloc/credit_card_bloc.dart';
import 'package:ecommerce/app/presentation/ui/components/custom_input_formatter.dart';
import 'package:ecommerce/app/presentation/ui/widgets/credit_card/register_credit_card_back.dart';
import 'package:ecommerce/app/presentation/ui/widgets/credit_card/register_credit_card_field.dart';
import 'package:ecommerce/app/presentation/ui/widgets/credit_card/register_credit_card_front.dart';
import 'package:ecommerce/core/exports/exports.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/services.dart';

class RegisterCreditCardPage extends StatefulWidget {
  const RegisterCreditCardPage({Key? key}) : super(key: key);

  @override
  State<RegisterCreditCardPage> createState() => _RegisterCreditCardPageState();
}

class _RegisterCreditCardPageState extends State<RegisterCreditCardPage> {
  final _formKey = GlobalKey<FormState>();
  final cardKey = GlobalKey<FlipCardState>();

  late TextEditingController _fullNameController;
  late TextEditingController _cardNumberController;
  late TextEditingController _expirationDateController;
  late TextEditingController _cvvCodeController;

  @override
  void initState() {
    _fullNameController = TextEditingController();
    _cardNumberController = TextEditingController();
    _expirationDateController = TextEditingController();
    _cvvCodeController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final creditCardBloc = GetIt.I.get<CreditCardBloc>();

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
              FlipCard(
                key: cardKey,
                front: RegisterCreditCardFront(
                  cardNumber: _cardNumberController.text,
                  cardName: _fullNameController.text,
                  expirationDate: _expirationDateController.text,
                ),
                back: RegisterCreditCardBack(cvvCode: _cvvCodeController.text),
              ),
              SizedBox(height: height * 0.01),
              const Text("This is just your credit card preview"),
              SizedBox(height: height * 0.02),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RegisterCreditCardField(
                      labelText: 'Name',
                      hintText: 'Jaime Scott',
                      icon: IconlyBold.profile,
                      textInputType: TextInputType.name,
                      controller: _fullNameController,
                      validatorFunction: (value) {
                        if (value!.isEmpty) {
                          return "Fill in the name correctly";
                        }
                        return null;
                      },
                      onChangedFunction: (text) {
                        setState(() {
                          _fullNameController.text = text;
                        });
                      },
                      onTapFunction: () {
                        if (!cardKey.currentState!.isFront) {
                          cardKey.currentState!.toggleCard();
                        }
                      },
                    ),
                    RegisterCreditCardField(
                      labelText: 'Card Number',
                      hintText: '1111 1111 1111 1111',
                      icon: MaterialCommunityIcons.credit_card,
                      controller: _cardNumberController,
                      textInputType: TextInputType.number,
                      validatorFunction: (value) {
                        if (value!.length < 19) {
                          return "Fill in the card number correctly";
                        }
                        return null;
                      },
                      onChangedFunction: (text) {
                        setState(() {
                          _cardNumberController.text = text;
                        });
                      },
                      onTapFunction: () {
                        if (!cardKey.currentState!.isFront) {
                          cardKey.currentState!.toggleCard();
                        }
                      },
                      maxLenght: 19,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CustomInputFormatter(quantity: 4, separator: " ")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RegisterCreditCardField(
                          labelText: 'Expiration Date',
                          hintText: '09/24',
                          icon: IconlyBold.calendar,
                          controller: _expirationDateController,
                          width: width * 0.45,
                          textInputType: TextInputType.number,
                          validatorFunction: (value) {
                            if (value!.length < 5) {
                              return "Fill out the date correctly";
                            }
                            return null;
                          },
                          onChangedFunction: (text) {
                            setState(() {
                              _expirationDateController.text = text;
                            });
                          },
                          onTapFunction: () {
                            if (!cardKey.currentState!.isFront) {
                              cardKey.currentState!.toggleCard();
                            }
                          },
                          maxLenght: 5,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CustomInputFormatter(quantity: 2, separator: '/')
                          ],
                        ),
                        RegisterCreditCardField(
                          labelText: 'CVV Code',
                          hintText: '091',
                          icon: IconlyBold.password,
                          controller: _fullNameController,
                          textInputType: TextInputType.number,
                          width: width * 0.45,
                          validatorFunction: (value) {
                            if (value!.length < 3) {
                              return 'Fill out the CVV correctly';
                            }
                            return null;
                          },
                          onChangedFunction: (text) {
                            setState(() {
                              _cvvCodeController.text = text;
                            });
                          },
                          onTapFunction: () {
                            if (cardKey.currentState!.isFront) {
                              cardKey.currentState!.toggleCard();
                            }
                          },
                          maxLenght: 3,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.03),
                    CustomElevatedButton(
                      width: double.infinity,
                      buttonTitle: 'Register',
                      paddingValue: 16,
                      onPressedFunction: () {
                        if (_formKey.currentState!.validate()) {
                          creditCardBloc.add(
                            AddCreditCardEvent(
                              fullName: _fullNameController.text,
                              cardNumber: _cardNumberController.text,
                              expirationDate: _expirationDateController.text,
                              cvvCode: _cvvCodeController.text,
                            ),
                          );
                          creditCardBloc.add(GetCreditCardsEvent());
                          Future.delayed(const Duration(milliseconds: 300), () {
                            Navigator.pop(context);
                          });
                        }
                      },
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
