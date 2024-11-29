part of 'product_detail_bloc.dart';

@immutable
sealed class ProductDetailEvent {}

class FetchProductEvent extends ProductDetailEvent {}

class IncreaseQuantityEvent extends ProductDetailEvent {}

class DecreaseQuantityEvent extends ProductDetailEvent {}

class ChangeColorEvent extends ProductDetailEvent {
  final int index;

  ChangeColorEvent({this.index = 0});
}

class ChangeImageEvent extends ProductDetailEvent {
  final int index;

  ChangeImageEvent({this.index = 0});
}

class AddToCartEvent extends ProductDetailEvent {
  final Product product;

  AddToCartEvent({required this.product});
}
