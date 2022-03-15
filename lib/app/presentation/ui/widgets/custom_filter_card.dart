import 'package:flutter/material.dart';

class CustomFilterCard extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;

  const CustomFilterCard({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.height;

    return InkWell(
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 4),
            padding: const EdgeInsets.all(12),
            height: MediaQuery.of(context).size.height * 0.06,
            child: Icon(icon, color: Theme.of(context).primaryColorDark),
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  blurRadius: 1,
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 2),
                )
              ],
            ),
          ),
          SizedBox(width: width * 0.015),
        ],
      ),
      onTap: onTap,
    );
  }
}
