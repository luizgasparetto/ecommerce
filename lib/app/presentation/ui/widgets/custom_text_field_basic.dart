import 'package:ecommerce/core/exports/exports.dart';

class CustomTextFieldBasic extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType textInputType;
  final void Function(String)? onChangedFunction;

  const CustomTextFieldBasic({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.onChangedFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
      obscureText: obscureText,
      keyboardType: textInputType,
      onChanged: onChangedFunction,
    );
  }
}
