import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/product_model.dart';
import '../repo/product_repo.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc() : super(const ProductDetailState()) {
    on<FetchProductEvent>(_onFetchProductEvent);
  }

  ProductRepo productRepo = ProductRepo();

  FutureOr<void> _onFetchProductEvent(
    FetchProductEvent event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    await productRepo.getProduct().then((value) {
      emit(state.copyWith(
        productData: value,
        isLoading: false,
      ));
    }).catchError((error) {
      emit(state.copyWith(
        isLoading: false,
      ));
    });
  }
}
