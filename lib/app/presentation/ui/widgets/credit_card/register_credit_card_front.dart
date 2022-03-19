import 'package:ecommerce/core/exports/exports.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterCreditCardFront extends StatelessWidget {
  final String cardNumber;
  final String cardName;
  final String expirationDate;

  const RegisterCreditCardFront({
    Key? key,
    required this.cardNumber,
    required this.cardName,
    required this.expirationDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: height * 0.25,
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
                color: Colors.white.withOpacity(0.6),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: height * 0.09, left: width * 0.03),
                child: Container(
                  width: width * 0.60,
                  height: height * 0.04,
                  padding: EdgeInsets.only(
                    left: width * 0.02,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    cardNumber.isEmpty ? "1111 1111 1111 1111" : cardNumber,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.6),
                      fontSize: MediaQuery.of(context).textScaleFactor * 22,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height * 0.16,
                  left: width * 0.03,
                  right: width * 0.03,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: width * 0.55,
                      height: height * 0.04,
                      padding: EdgeInsets.only(
                        left: width * 0.02,
                        top: height * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        cardName.isEmpty ? "Jaime Scoot" : cardName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.6),
                          fontSize: MediaQuery.of(context).textScaleFactor * 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    Container(
                      width: width * 0.15,
                      height: height * 0.04,
                      padding: EdgeInsets.only(
                        left: width * 0.015,
                        top: height * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        expirationDate.isEmpty ? "00/00" : expirationDate,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.6),
                          fontSize: MediaQuery.of(context).textScaleFactor * 18,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
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
