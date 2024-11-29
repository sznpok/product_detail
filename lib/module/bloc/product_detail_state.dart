part of 'product_detail_bloc.dart';

class ProductDetailState extends Equatable {
  final ProductDataModel? productData;
  final bool isLoading;
  final int quantity;
  final String? colorName;
  final int price;
  final String colorCode;
  final String? image;
  final List<Product> product;

  const ProductDetailState(
      {this.productData,
      this.isLoading = false,
      this.quantity = 0,
      this.colorName = "",
      this.colorCode = "",
      this.image,
      this.product = const [],
      this.price = 0});

  ProductDetailState copyWith({
    ProductDataModel? productData,
    bool? isLoading,
    int? quantity,
    String? colorName,
    String? colorCode,
    String? image,
    List<Product>? product,
    int? price,
  }) {
    return ProductDetailState(
      productData: productData ?? this.productData,
      isLoading: isLoading ?? this.isLoading,
      quantity: quantity ?? this.quantity,
      colorName: colorName ?? this.colorName,
      price: price ?? this.price,
      colorCode: colorCode ?? this.colorCode,
      image: image ?? this.image,
      product: product ?? this.product,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        productData,
        isLoading,
        quantity,
        colorName,
        colorCode,
        price,
        image,
        product,
      ];
}
