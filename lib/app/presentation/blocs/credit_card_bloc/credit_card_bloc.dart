import 'package:bloc/bloc.dart';
import 'package:ecommerce/app/domain/entities/credit_card_entity.dart';
import 'package:ecommerce/app/presentation/controllers/credit_card_controller.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as dev;

part 'credit_card_event.dart';
part 'credit_card_state.dart';

class CreditCardBloc extends Bloc<CreditCardEvent, CreditCardState> {
  final CreditCardController _creditCardController;

  CreditCardBloc(this._creditCardController) : super(CreditCardLoadingState()) {
    on<GetCreditCardsEvent>((event, emit) async {
      try {
        final creditCards = await _creditCardController.getCreditCards();
        emit(CreditCardLoadedState(creditCards));
      } catch (e) {
        emit(CreditCardErrorState());
      }
    });

    on<AddCreditCardEvent>((event, emit) async {
      try {
        await _creditCardController.addCreditCard(
          fullName: event.fullName,
          cardNumber: event.cardNumber,
          expirationDate: event.expirationDate,
          cvvCode: event.cvvCode,
        );
      } catch (e, st) {
        emit(CreditCardErrorState());
        dev.log('ERRO AO ADICIONAR O CARTÃO', error: e, stackTrace: st);
      }
    });

    on<RemoveCreditCardEvent>((event, emit) async {
      try {
        await _creditCardController.removeCreditCard(event.creditCard);
      } catch (e, st) {
        emit(CreditCardErrorState());
        dev.log('ERRO AO REMOVER O CARTÃO', error: e, stackTrace: st);
      }
    });
  }
}
