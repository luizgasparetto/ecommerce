import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonTitle;
  final double paddingValue;
  final void Function()? onPressedFunction;
  final double? width;

  const CustomElevatedButton({
    Key? key,
    required this.buttonTitle,
    required this.onPressedFunction,
    required this.paddingValue,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColorDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(paddingValue),
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontSize: MediaQuery.of(context).textScaleFactor * 20,
            ),
          ),
        ),
        onPressed: onPressedFunction,
      ),
    );
  }
}
