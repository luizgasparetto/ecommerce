import 'package:ecommerce/app/presentation/blocs/get_product_list/get_product_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:iconly/iconly.dart';

import '../../widgets/custom_filter_card.dart';
import '../../widgets/custom_product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.height;
    final height = MediaQuery.of(context).size.height;

    final bloc = GetIt.I.get<GetProductListBloc>();

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: height * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * 0.045),
                child: Stack(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.005),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          IconlyBold.notification,
                          size: height * 0.04,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            MaterialCommunityIcons.cart,
                            size: height * 0.04,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            IconlyBold.profile,
                            size: height * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Discover',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaleFactor * 32,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.005),
              Text(
                'Find anything what you want',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaleFactor * 14,
                  fontFamily: 'Lato',
                  color: Colors.grey.shade500,
                ),
              ),
              SizedBox(height: height * 0.03),
              SizedBox(
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
                    prefixIcon: const Icon(IconlyLight.search),
                    hintText: 'Search',
                    hintStyle: const TextStyle(),
                  ),
                  textAlignVertical: TextAlignVertical.bottom,
                  onChanged: (value) => bloc
                    ..add(FetchProductListBySearchBarEvent(searchText: value)),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.only(left: width * 0.015),
                child: Row(
                  children: [
                    CustomFilterCard(
                      icon: MaterialCommunityIcons.all_inclusive,
                      onTap: () async =>
                          bloc..add(const FetchProductListByTagEvent()),
                    ),
                    CustomFilterCard(
                      icon: MaterialCommunityIcons.tshirt_crew,
                      onTap: () async => bloc
                        ..add(const FetchProductListByTagEvent(
                            tag: 'top-clothing')),
                    ),
                    CustomFilterCard(
                      icon: MaterialCommunityIcons.shoe_print,
                      onTap: () async => bloc
                        ..add(const FetchProductListByTagEvent(tag: 'shoes')),
                    ),
                    CustomFilterCard(
                      icon: MaterialCommunityIcons.hat_fedora,
                      onTap: () async => bloc
                        ..add(const FetchProductListByTagEvent(tag: 'cap')),
                    ),
                    CustomFilterCard(
                      icon: MaterialCommunityIcons.purse,
                      onTap: () async => bloc
                        ..add(const FetchProductListByTagEvent(tag: 'purse')),
                    ),
                  ],
                ),
              ),
              BlocBuilder<GetProductListBloc, GetProductListState>(
                builder: ((context, state) {
                  if (state is GetProductListLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is GetProductListLoadedState) {
                    return Container(
                      margin: EdgeInsets.only(bottom: height * 0.02),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: height * 0.32,
                        ),
                        itemCount: state.productList.length,
                        itemBuilder: (context, index) {
                          final product = state.productList[index];

                          return CustomProductCard(
                              productTitle: product!.name,
                              productValue: product.value.toString(),
                              productMainImg: product.imgUrls[0],
                              onTap: () {
                                bloc.add(
                                    const FetchProductListBySearchBarEvent());
                                Navigator.pushNamed(
                                  context,
                                  '/product_details',
                                  arguments: product,
                                );
                              });
                        },
                      ),
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
