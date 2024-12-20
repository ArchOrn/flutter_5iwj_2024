part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeError extends HomeState {
  final String errorMessage;

  HomeError({required this.errorMessage});
}

final class HomeSuccess extends HomeState {
  final List<Product> products;

  HomeSuccess({required this.products});
}