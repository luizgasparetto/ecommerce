import 'package:ecommerce/core/exports/exports.dart';
import 'package:flutter/services.dart';

class RegisterCreditCardField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final String? Function(String?)? validatorFunction;
  final double width;
  final CrossAxisAlignment crossAxisAlignment;
  final void Function()? onTapFunction;
  final void Function(String)? onChangedFunction;
  final TextInputType textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLenght;

  const RegisterCreditCardField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.validatorFunction,
    this.width = double.infinity,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    required this.onTapFunction,
    required this.onChangedFunction,
    required this.textInputType,
    this.inputFormatters,
    this.maxLenght,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.02,
            vertical: height * 0.005,
          ),
          child: Text(
            labelText,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: this.width,
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              prefixIcon: Icon(icon),
              hintText: hintText,
            ),
            validator: validatorFunction,
            onTap: onTapFunction,
            onChanged: onChangedFunction,
            keyboardType: textInputType,
            inputFormatters: inputFormatters,
            maxLength: maxLenght,
          ),
        ),
        SizedBox(height: height * 0.025),
      ],
    );
  }
}
