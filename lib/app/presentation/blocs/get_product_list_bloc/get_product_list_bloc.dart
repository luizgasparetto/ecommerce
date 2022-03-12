import 'package:bloc/bloc.dart';
import 'package:ecommerce/app/domain/entities/product_entity.dart';
import 'package:ecommerce/app/presentation/controllers/get_products_controller.dart';
import 'package:equatable/equatable.dart';
import 'dart:developer' as dev;

part 'get_product_list_event.dart';
part 'get_product_list_state.dart';

class GetProductListBloc
    extends Bloc<GetProductListEvent, GetProductListState> {
  final GetProductsController _getProductsController;

  GetProductListBloc(this._getProductsController)
      : super(GetProductListLoadingState()) {
    //
    on<FetchProductListByTagEvent>((event, emit) async {
      try {
        final productList = await _getProductsController.filterByTag(event.tag);
        emit(GetProductListLoadedState(productList));
      } catch (e, st) {
        emit(GetProductListErrorState());
        dev.log('ERRO GET_PRODUCT_LIST_BY_TAG', error: e, stackTrace: st);
      }
    });

    on<FetchProductListBySearchBarEvent>((event, emit) async {
      try {
        final productList =
            await _getProductsController.filterBySearchBar(event.searchText);
        emit(GetProductListLoadedState(productList));
      } catch (e, st) {
        emit(GetProductListErrorState());
        dev.log('ERRO GET_PRODUCT_LIST_BY_SEARCHBAR', error: e, stackTrace: st);
      }
    });
  }
}
