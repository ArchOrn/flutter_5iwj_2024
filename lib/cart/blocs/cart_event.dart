part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartLinesLoaded extends CartEvent {}

class CartLineAdded extends CartEvent {
  final Product product;

  CartLineAdded({required this.product});
}

class CartLineRemoved extends CartEvent {
  final int productId;

  CartLineRemoved({required this.productId});
}
