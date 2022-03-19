import 'package:ecommerce/core/exports/exports.dart';

class CreditCardBack extends StatelessWidget {
  final String cvvCode;

  const CreditCardBack({
    Key? key,
    required this.cvvCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: height * 0.25,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorDark,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.03),
              child: Container(
                width: double.infinity,
                height: height * 0.07,
                color: Colors.grey.shade500,
                child: Padding(
                  padding: EdgeInsets.only(right: width * 0.08),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      cvvCode,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorDark,
                        fontSize: MediaQuery.of(context).textScaleFactor * 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "If you have any questions regarding your card, please don't hesitate to contact us immediately, our support is available 24 hours a day.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color.fromARGB(255, 243, 239, 239),
                  fontSize: MediaQuery.of(context).textScaleFactor * 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
