part of 'cart_bloc.dart';

enum CartStatus { initial, loading, success, error }

class CartState {
  final CartStatus status;
  final List<CartLine> lines;
  final String? errorMessage;

  CartState({
    this.status = CartStatus.initial,
    this.lines = const [],
    this.errorMessage,
  });

  int get count => lines.fold(0, (acc, line) => acc + line.quantity);

  CartState copyWith({
    CartStatus? status,
    List<CartLine>? lines,
    String? errorMessage,
  }) {
    return CartState(
      status: status ?? this.status,
      lines: lines ?? this.lines,
      errorMessage: errorMessage,
    );
  }
}
