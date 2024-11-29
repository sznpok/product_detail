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
    on<IncreaseQuantityEvent>(_onIncreaseQuantityEvent);
    on<DecreaseQuantityEvent>(_onDecreaseQuantityEvent);
    on<ChangeColorEvent>(_onChangeColorEvent);
    on<ChangeImageEvent>(_onChangeImageEvent);
    on<AddToCartEvent>(_onAddToCartEvent);
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
      print("Images ${value.product!.colorVariants![0].images}");
      emit(state.copyWith(
          productData: value,
          isLoading: false,
          colorCode: value.product!.colorVariants![0].productCode,
          colorName: value.product!.colorVariants![0].color!.name,
          price: value.product!.colorVariants![0].price,
          image: value.product!.images![0]));
    }).catchError((error) {
      emit(state.copyWith(
        isLoading: false,
      ));
    });
  }

  FutureOr<void> _onIncreaseQuantityEvent(
    IncreaseQuantityEvent event,
    Emitter<ProductDetailState> emit,
  ) {
    emit(state.copyWith(
      quantity: state.quantity + 1,
    ));
  }

  FutureOr<void> _onDecreaseQuantityEvent(
    DecreaseQuantityEvent event,
    Emitter<ProductDetailState> emit,
  ) {
    if (state.quantity > 0) {
      emit(state.copyWith(
        quantity: state.quantity - 1,
      ));
    }
  }

  FutureOr<void> _onChangeColorEvent(
    ChangeColorEvent event,
    Emitter<ProductDetailState> emit,
  ) {
    emit(state.copyWith(
      colorName:
          state.productData!.product!.colorVariants![event.index].color!.name,
      colorCode:
          state.productData!.product!.colorVariants![event.index].productCode,
      price: state.productData!.product!.colorVariants![event.index].price,
    ));
  }

  FutureOr<void> _onChangeImageEvent(
    ChangeImageEvent event,
    Emitter<ProductDetailState> emit,
  ) {
    emit(state.copyWith(
      image: state.productData!.product!.images![event.index],
    ));
  }

  FutureOr<void> _onAddToCartEvent(
    AddToCartEvent event,
    Emitter<ProductDetailState> emit,
  ) {
    final List<Product> productList = List.from(state.product);
    productList.add(event.product);
    emit(state.copyWith(
      quantity: state.quantity,
      product: productList,
    ));
  }
}
