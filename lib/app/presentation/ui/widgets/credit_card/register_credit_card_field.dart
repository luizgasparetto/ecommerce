import 'package:ecommerce/core/exports/exports.dart';

class RegisterCreditCardField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final String? Function(String?)? validatorFunction;

  const RegisterCreditCardField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.validatorFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: width * 0.02,
            bottom: height * 0.01,
          ),
          child: Text(
            labelText,
            style: const TextStyle(fontWeight: FontWeight.bold),
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
            prefixIcon: Icon(icon),
            hintText: hintText,
          ),
          validator: validatorFunction,
        ),
      ],
    );
  }
}
