import 'package:ecommerce/app/domain/entities/product_entity.dart';
import 'package:ecommerce/app/presentation/widgets/custom_store_card.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final product = ModalRoute.of(context)!.settings.arguments as ProductEntity;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.05),
              child: Image.network(product.imgUrls[0]),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: height * 0.05),
              child: Text(
                product.name,
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontSize: MediaQuery.of(context).textScaleFactor * 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
                maxLines: 1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.05,
                left: width * 0.01,
              ),
              child: Text(
                'Size: ${product.size}',
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: MediaQuery.of(context).textScaleFactor * 14,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                  left: width * 0.05,
                  right: width * 0.05,
                  top: height * 0.3,
                ),
                // Start store Card
                child: const CustomStoreCard(),
                //Finish store card
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.48),
                child: Text(
                  'Contact us if you have any questions\n about this product',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.75),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).textScaleFactor * 18,
                        ),
                      ),
                      Text(
                        '\$ ${product.value.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).textScaleFactor * 32,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColorDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).textScaleFactor * 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
