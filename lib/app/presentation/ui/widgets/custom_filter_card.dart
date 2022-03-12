import 'package:flutter/material.dart';

class CustomFilterCard extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;

  const CustomFilterCard({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 0.075,
        child: Icon(icon, color: Theme.of(context).primaryColor),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onTap: onTap,
    );
  }
}
