import 'package:flutter/material.dart';

class CustomTextFieldBasic extends StatelessWidget {
  final String hintText;
  final IconData icon;

  const CustomTextFieldBasic({
    Key? key,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.07,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: const TextStyle(),
        ),
        textAlignVertical: TextAlignVertical.bottom,
      ),
    );
  }
}
