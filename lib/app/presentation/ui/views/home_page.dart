import 'package:ecommerce/app/presentation/widgets/custom_product_card.dart';
import 'package:ecommerce/app/presentation/widgets/custom_text_field_basic.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => const HomePage(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(height * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/frequently_questions'),
                      icon: Icon(IconlyLight.document, size: height * 0.04),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(IconlyLight.profile, size: height * 0.04),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.04),
              const CustomTextFieldBasic(
                hintText: 'Air Jordan 1',
                icon: IconlyLight.search,
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.05),
                child: Text(
                  'Best Sellers',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).textScaleFactor * 32,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              const CustomProductCart(
                productTitle: 'Air Max 97',
                productValue: '\$ 59.99',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
