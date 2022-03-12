part of 'get_product_list_bloc.dart';

abstract class GetProductListState extends Equatable {
  const GetProductListState();

  @override
  List<Object> get props => [];
}

class GetProductListLoadingState extends GetProductListState {}

class GetProductListLoadedState extends GetProductListState {
  final List<ProductEntity?> productList;

  const GetProductListLoadedState(this.productList);

  @override
  List<Object> get props => [productList];
}

class GetProductListErrorState extends GetProductListState {}
