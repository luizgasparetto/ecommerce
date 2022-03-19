import 'package:ecommerce/core/exports/exports.dart';

class CustomUserTile extends StatelessWidget {
  final double leftPadding;
  final double mainIconSize;
  final IconData mainIcon;
  final IconData? trailingIcon;
  final String title;
  final String? subtitle;
  final void Function()? onPressedFuntion;

  const CustomUserTile({
    Key? key,
    this.leftPadding = 0.03,
    this.trailingIcon,
    required this.mainIcon,
    this.mainIconSize = 0.05,
    required this.title,
    this.subtitle,
    this.onPressedFuntion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return InkWell(
      child: ListTile(
        leading: Padding(
          padding: EdgeInsets.only(left: width * leftPadding),
          child: Icon(
            mainIcon,
            color: Theme.of(context).primaryColorDark,
            size: height * mainIconSize,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(color: Theme.of(context).primaryColorDark),
        ),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        tileColor: Colors.white,
        trailing: Icon(
          trailingIcon,
          color: Theme.of(context).primaryColorDark,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      onTap: onPressedFuntion ?? () {},
    );
  }
}
