import 'package:ecommerce/app/presentation/blocs/credit_card_bloc/credit_card_bloc.dart';
import 'package:ecommerce/app/presentation/ui/widgets/credit_card/credit_card_back.dart';
import 'package:ecommerce/app/presentation/ui/widgets/credit_card/credit_card_front.dart';
import 'package:ecommerce/core/exports/exports.dart';
import 'package:flip_card/flip_card.dart';

class CreditCardsPage extends StatelessWidget {
  const CreditCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColorDark),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        child: const Icon(Icons.add),
        onPressed: () => Navigator.pushNamed(context, '/register_credit_cards'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Credit Cards',
              style: TextStyle(
                fontSize: MediaQuery.of(context).textScaleFactor * 32,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.005),
            Padding(
              padding: EdgeInsets.only(left: width * 0.01),
              child: Text(
                'Register and use your credit cards easily',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaleFactor * 14,
                  fontFamily: 'Lato',
                  color: Colors.grey.shade500,
                ),
              ),
            ),
            SizedBox(height: height * 0.05),
            BlocBuilder<CreditCardBloc, CreditCardState>(
              builder: (context, state) {
                if (state is CreditCardLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CreditCardLoadedState) {
                  final creditCards = state.creditCards;

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: creditCards.length,
                    itemBuilder: (context, index) {
                      final creditCard = creditCards[index];

                      return FlipCard(
                        front: CreditCardFront(
                          fullName: creditCard.fullName,
                          cardNumber: creditCard.cardNumber,
                          expirationCode: creditCard.expirationDate,
                        ),
                        back: CreditCardBack(
                          cvvCode: creditCard.cvvCode,
                        ),
                        fill: Fill.fillBack,
                        speed: 600,
                      );
                    },
                  );
                } else if (state is CreditCardEmptyState) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: Text('DEU ERRO'));
                }
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
