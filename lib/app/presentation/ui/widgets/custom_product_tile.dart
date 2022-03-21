import 'package:ecommerce/core/exports/exports.dart';
import 'package:flutter/cupertino.dart';

class CustomProductTile extends StatelessWidget {
  final ProductEntity product;

  const CustomProductTile({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final cartBloc = GetIt.I.get<CartBloc>();

    return SizedBox(
      height: height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.20,
            child: Image.network(product.imgUrls[0]),
          ),
          SizedBox(width: width * 0.02),
          SizedBox(
            width: width * 0.48,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).textScaleFactor * 15,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Text(
                  'Size: ${product.size}',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).textScaleFactor * 15,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(height: height * 0.005),
                Text(
                  '\$ ${product.value.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).textScaleFactor * 18,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(
              CupertinoIcons.trash_fill,
              color: Theme.of(context).primaryColorDark,
              size: height * 0.027,
            ),
            onPressed: () {
              cartBloc.add(DeleteCartProductEvent(product));
              cartBloc.add(GetCartProductsEvent());
            },
          ),
        ],
      ),
    );
  }
}
