import 'package:ecommerce/app/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:ecommerce/app/presentation/ui/widgets/custom_elevated_button.dart';
import 'package:ecommerce/app/presentation/ui/widgets/custom_product_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
        title: Text(
          'Cart',
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is CartProductsLoadedState) {
                final productList = state.cartProducts;

                return Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return CustomProductTile(product: productList[index]);
                      },
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total Price",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          16,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              Text(
                                "\$ ${state.totalValue.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          32,
                                ),
                              ),
                            ],
                          ),
                          CustomElevatedButton(
                            buttonTitle: 'Checkout',
                            paddingValue: 20,
                            onPressedFunction: () {},
                          )
                        ],
                      ),
                    )
                  ],
                );
              } else if (state is CartEmptyState) {
                return SizedBox(
                  height: height * 0.15,
                  child: Lottie.asset('assets/lottie/empty.json'),
                );
              } else if (state is CartErrorState) {
                final message = state.errorMessage;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(message),
                ));
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
