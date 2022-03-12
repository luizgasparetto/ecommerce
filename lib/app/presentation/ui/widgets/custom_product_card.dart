import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CustomProductCard extends StatelessWidget {
  final String productTitle;
  final String productValue;
  final String productMainImg;
  final void Function()? onTap;

  const CustomProductCard({
    Key? key,
    required this.productTitle,
    required this.productValue,
    required this.productMainImg,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      child: Container(
        width: width * 0.4,
        height: height * 0.35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            //Image
            Container(
              margin: const EdgeInsets.only(left: 5, top: 10),
              height: height * 0.21,
              child: Image.network(
                productMainImg,
                fit: BoxFit.fitHeight,
              ),
            ),
            // Adicionar Padding All 16 para todos a baixo
            Container(
              margin: EdgeInsets.only(top: height * 0.22),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productTitle,
                    style: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${double.parse(productValue).toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          //color: Theme.of(context).primaryColor,
                        ),
                      ),
                      InkWell(
                        child: const Icon(AntDesign.shoppingcart),
                        onTap: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
