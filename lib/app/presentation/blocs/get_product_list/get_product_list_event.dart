part of 'get_product_list_bloc.dart';

abstract class GetProductListEvent extends Equatable {
  const GetProductListEvent();

  @override
  List<Object> get props => [];
}

class FetchProductListEvent extends GetProductListEvent {}
