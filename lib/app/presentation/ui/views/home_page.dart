import 'package:ecommerce/core/exports/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.height;
    final height = MediaQuery.of(context).size.height;

    final productBloc = GetIt.I.get<GetProductListBloc>();
    final authBloc = GetIt.I.get<AuthBloc>();
    final cartBloc = GetIt.I.get<CartBloc>();

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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(
                            MaterialCommunityIcons.logout,
                            size: height * 0.04,
                          ),
                          onPressed: () {
                            authBloc.add(LogoutEvent());
                            Future.delayed(const Duration(milliseconds: 500),
                                () {
                              Navigator.pop(context);
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            MaterialCommunityIcons.cart,
                            size: height * 0.04,
                          ),
                          onPressed: () {
                            cartBloc.add(GetCartProductsEvent());
                            Future.delayed(const Duration(milliseconds: 100),
                                () {
                              Navigator.pushNamed(context, '/cart');
                            });
                          },
                        ),
                        IconButton(
                          onPressed: () async {
                            cartBloc.add(GetCartProductsEvent());
                            authBloc.add(GetUserEvent());
                            Navigator.pushNamed(context, '/usr');
                          },
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
                  onChanged: (value) => productBloc
                    ..add(FetchProductListBySearchBarEvent(searchText: value)),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.only(left: width * 0.015),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFilterCard(
                      icon: MaterialCommunityIcons.all_inclusive,
                      onTap: () async =>
                          productBloc..add(const FetchProductListByTagEvent()),
                    ),
                    CustomFilterCard(
                      icon: MaterialCommunityIcons.tshirt_crew,
                      onTap: () async => productBloc
                        ..add(const FetchProductListByTagEvent(
                            tag: 'top-clothing')),
                    ),
                    CustomFilterCard(
                      icon: MaterialCommunityIcons.shoe_print,
                      onTap: () async => productBloc
                        ..add(const FetchProductListByTagEvent(tag: 'shoes')),
                    ),
                    CustomFilterCard(
                      icon: MaterialCommunityIcons.hat_fedora,
                      onTap: () async => productBloc
                        ..add(const FetchProductListByTagEvent(tag: 'cap')),
                    ),
                    CustomFilterCard(
                      icon: MaterialCommunityIcons.purse,
                      onTap: () async => productBloc
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
                              product: product,
                              onTap: () {
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
