import 'package:ecommerce/app/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:iconly/iconly.dart';

class UserMainPage extends StatelessWidget {
  const UserMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final authBloc = context.read<AuthBloc>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                leading: Icon(
                  IconlyBold.profile,
                  color: Theme.of(context).primaryColorDark,
                  size: height * 0.07,
                ),
                title: Text(
                  "Consumer's full name",
                  style: TextStyle(color: Theme.of(context).primaryColorDark),
                ),
                subtitle: const Text("Consumer's email"),
                // trailing: Icon(
                //   MaterialCommunityIcons.arrow_right,
                //   color: Theme.of(context).primaryColorDark,
                // ),
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(height: height * 0.04),
              //Divider(color: Theme.of(context).primaryColorDark),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.only(left: width * 0.03),
                  child: Icon(
                    MaterialCommunityIcons.basket,
                    color: Theme.of(context).primaryColorDark,
                    size: height * 0.045,
                  ),
                ),
                title: Text(
                  "All your orders",
                  style: TextStyle(color: Theme.of(context).primaryColorDark),
                ),
                subtitle: const Text("Check them right out anytime"),
                tileColor: Colors.white,
                trailing: Icon(
                  MaterialCommunityIcons.arrow_right,
                  color: Theme.of(context).primaryColorDark,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(height: height * 0.015),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.only(left: width * 0.03),
                  child: Icon(
                    MaterialCommunityIcons.star,
                    color: Theme.of(context).primaryColorDark,
                    size: height * 0.045,
                  ),
                ),
                title: Text(
                  "All your reviews",
                  style: TextStyle(color: Theme.of(context).primaryColorDark),
                ),
                subtitle: const Text("Check them right out anytime"),
                tileColor: Colors.white,
                trailing: Icon(
                  MaterialCommunityIcons.arrow_right,
                  color: Theme.of(context).primaryColorDark,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(height: height * 0.04),
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.only(left: width * 0.03),
                  child: Icon(
                    MaterialCommunityIcons.map_marker,
                    color: Theme.of(context).primaryColorDark,
                    size: height * 0.045,
                  ),
                ),
                title: Text(
                  "Delivery address",
                  style: TextStyle(color: Theme.of(context).primaryColorDark),
                ),
                tileColor: Colors.white,
                trailing: Icon(
                  MaterialCommunityIcons.arrow_right,
                  color: Theme.of(context).primaryColorDark,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(height: height * 0.04),
              InkWell(
                child: ListTile(
                  title: Text(
                    "Logout",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: MediaQuery.of(context).textScaleFactor * 20),
                    textAlign: TextAlign.center,
                  ),
                  tileColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onTap: () async {
                  authBloc.add(LogoutEvent());
                  Future.delayed(const Duration(milliseconds: 500), () {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
