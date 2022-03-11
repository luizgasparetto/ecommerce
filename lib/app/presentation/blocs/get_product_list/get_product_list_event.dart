part of 'get_product_list_bloc.dart';

abstract class GetProductListEvent extends Equatable {
  const GetProductListEvent();

  @override
  List<Object> get props => [];
}

class FetchProductListByTagEvent extends GetProductListEvent {
  final String? tag;

  const FetchProductListByTagEvent({this.tag});
}

class FetchProductListBySearchBarEvent extends GetProductListEvent {
  final String? searchText;

  const FetchProductListBySearchBarEvent({this.searchText});
}
