part of 'product_detail_bloc.dart';

@immutable
sealed class ProductDetailEvent {}

class FetchProductEvent extends ProductDetailEvent {}
