part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class ProductLoaded extends ProductEvent {
  final int id;

  ProductLoaded({required this.id});
}
