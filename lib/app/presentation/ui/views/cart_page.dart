import 'package:ecommerce/app/presentation/blocs/cart_bloc/cart_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadingState) {
              return const CircularProgressIndicator();
            } else if (state is CartItemsLoadedState) {
              final productList = state.cartProducts;

              return productList.isEmpty
                  ? const Text('SEM ITENS')
                  : ListView.builder(
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Image.network(productList[index].imgUrls[0]),
                          title: Text(productList[index].name),
                          subtitle: Text('\$ ${productList[index].value}'),
                        );
                      },
                    );
            } else {
              return const Text('DEU ERRO');
            }
          },
        ),
      ),
    );
  }
}
