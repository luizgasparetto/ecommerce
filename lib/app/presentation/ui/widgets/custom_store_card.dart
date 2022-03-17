import 'package:ecommerce/core/exports/exports.dart';

class CustomStoreCard extends StatelessWidget {
  const CustomStoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: height * 0.1,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(237, 239, 241, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 12),
              width: width * 0.15,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 12,
                    bottom: 8,
                    top: 8,
                  ),
                  child: Text(
                    'Store Official Name',
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                      fontSize: MediaQuery.of(context).textScaleFactor * 15,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 45),
                  child: Text(
                    'view more',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontFamily: 'Lato',
                      fontSize: MediaQuery.of(context).textScaleFactor * 14,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(MaterialCommunityIcons.arrow_right),
            ),
          ],
        ),
      ),
    );
  }
}
