part of 'credit_card_bloc.dart';

abstract class CreditCardState extends Equatable {
  const CreditCardState();

  @override
  List<Object> get props => [];
}

class CreditCardLoadingState extends CreditCardState {}

class CreditCardLoadedState extends CreditCardState {
  final List<CreditCardEntity> creditCards;

  const CreditCardLoadedState(this.creditCards);

  @override
  List<Object> get props => [creditCards];
}

class CreditCardEmptyState extends CreditCardState {
  final String message;

  const CreditCardEmptyState(this.message);

  @override
  List<Object> get props => [message];
}

class CreditCardErrorState extends CreditCardState {}
