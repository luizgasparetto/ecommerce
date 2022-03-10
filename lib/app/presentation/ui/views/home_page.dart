import 'package:ecommerce/app/presentation/blocs/get_product_list/get_product_list_bloc.dart';
import 'package:ecommerce/app/presentation/widgets/custom_product_card.dart';
import 'package:ecommerce/app/presentation/widgets/custom_text_field_basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
                padding: EdgeInsets.only(top: height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/frequently_questions'),
                      icon: Icon(IconlyLight.document, size: height * 0.04),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/cart'),
                          icon:
                              Icon(AntDesign.shoppingcart, size: height * 0.04),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(IconlyLight.profile, size: height * 0.04),
                        ),
                      ],
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
              BlocBuilder<GetProductListBloc, GetProductListState>(
                builder: ((context, state) {
                  if (state is GetProductListLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetProductListLoadedState) {
                    final productList = state.productList;

                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: height * 0.32,
                      ),
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return CustomProductCard(
                          productTitle: productList[index].name,
                          productValue: productList[index].value.toString(),
                          productMainImg: productList[index].imgUrls[0],
                        );
                      },
                    );
                  } else {
                    return const Center(child: Text('ERROR'));
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
