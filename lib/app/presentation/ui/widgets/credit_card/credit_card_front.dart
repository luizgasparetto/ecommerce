import 'package:ecommerce/core/exports/exports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreditCardFront extends StatelessWidget {
  final String fullName;
  final String cardNumber;
  final String expirationDate;

  const CreditCardFront({
    Key? key,
    required this.fullName,
    required this.cardNumber,
    required this.expirationDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: height * 0.28,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              SvgPicture.asset(
                'assets/svg/visa.svg',
                height: height * 0.1,
                color: const Color.fromARGB(255, 246, 243, 243),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.11, left: width * 0.03),
                child: Text(
                  cardNumber,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 243, 239, 239),
                    fontSize: MediaQuery.of(context).textScaleFactor * 22,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.2,
                  left: width * 0.03,
                  right: width * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      fullName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 243, 239, 239),
                        fontSize: MediaQuery.of(context).textScaleFactor * 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      expirationDate,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 243, 239, 239),
                        fontSize: MediaQuery.of(context).textScaleFactor * 18,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
