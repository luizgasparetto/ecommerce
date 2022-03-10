import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CustomProductCart extends StatelessWidget {
  final String productTitle;
  final String productValue;
  //final String productMainImg;

  const CustomProductCart({
    Key? key,
    required this.productTitle,
    required this.productValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return InkWell(
      child: Container(
        width: width * 0.38,
        height: height * 0.35,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              Container(
                height: height * 0.22,
                color: Colors.red,
                child: const Center(
                  child: Text('Image', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: height * 0.01),
              //Title
              Text(
                productTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.015),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productValue,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
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
      ),
      onTap: () => Navigator.pushNamed(context, '/product_details'),
    );
  }
}
