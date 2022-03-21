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

  final ValueNotifier nameNotifier = ValueNotifier("");
  final ValueNotifier cardNumberNotifier = ValueNotifier("");
  final ValueNotifier expirationDateNotifier = ValueNotifier("");
  final ValueNotifier cvvNotifier = ValueNotifier("");

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
                  cardNumber: cardNumberNotifier.value,
                  cardName: nameNotifier.value,
                  expirationDate: expirationDateNotifier.value,
                ),
                back: ValueListenableBuilder(
                  valueListenable: cvvNotifier,
                  builder: (context, value, child) {
                    return RegisterCreditCardBack(cvvCode: value.toString());
                  },
                ),
              ),
              SizedBox(height: height * 0.01),
              // const Text("This is just your credit card preview"),
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
                      validatorFunction: (value) {
                        if (value!.isEmpty) {
                          return "Fill in the name correctly";
                        }
                        return null;
                      },
                      onChangedFunction: (value) => nameNotifier.value = value,
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
                      textInputType: TextInputType.number,
                      validatorFunction: (value) {
                        if (value!.length < 19) {
                          return "Fill in the card number correctly";
                        }
                        return null;
                      },
                      onChangedFunction: (value) {
                        cardNumberNotifier.value = value;
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
                          width: width * 0.45,
                          textInputType: TextInputType.number,
                          validatorFunction: (value) {
                            if (value!.length < 5) {
                              return "Fill out the date correctly";
                            }
                            return null;
                          },
                          onChangedFunction: (value) {
                            expirationDateNotifier.value = value;
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
                          textInputType: TextInputType.number,
                          width: width * 0.45,
                          validatorFunction: (value) {
                            if (value!.length < 3) {
                              return 'Fill out the CVV correctly';
                            }
                            return null;
                          },
                          onChangedFunction: (value) {
                            cvvNotifier.value = value;
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
                              fullName: nameNotifier.value,
                              cardNumber: cardNumberNotifier.value,
                              expirationDate: expirationDateNotifier.value,
                              cvvCode: cvvNotifier.value,
                            ),
                          );
                          creditCardBloc.add(GetCreditCardsEvent());
                          Navigator.pop(context);
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
