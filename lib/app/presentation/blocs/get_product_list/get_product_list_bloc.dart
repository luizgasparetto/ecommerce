import 'package:bloc/bloc.dart';
import 'package:ecommerce/app/domain/entities/product_entity.dart';
import 'package:ecommerce/app/domain/usecases/get_product_list/get_product_list_usecase.dart';
import 'package:equatable/equatable.dart';

part 'get_product_list_event.dart';
part 'get_product_list_state.dart';

class GetProductListBloc
    extends Bloc<GetProductListEvent, GetProductListState> {
  final GetProductListUsecase _getProductListUsecase;

  GetProductListBloc(this._getProductListUsecase)
      : super(GetProductListLoadingState()) {
    //
    on<FetchProductListEvent>((event, emit) async {
      try {
        final productList = await _getProductListUsecase.handle();
        emit(GetProductListLoadedState(productList));
      } catch (e) {
        emit(GetProductListErrorState());
      }
    });
  }
}
