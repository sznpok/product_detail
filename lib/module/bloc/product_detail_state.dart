part of 'product_detail_bloc.dart';

class ProductDetailState extends Equatable {
  final ProductDataModel? productData;
  final bool isLoading;

  const ProductDetailState({this.productData, this.isLoading = false});

  ProductDetailState copyWith(
      {ProductDataModel? productData, bool? isLoading}) {
    return ProductDetailState(
      productData: productData ?? this.productData,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        productData,
        isLoading,
      ];
}
