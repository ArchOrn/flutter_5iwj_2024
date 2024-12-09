import 'package:flutter/foundation.dart';
import 'package:flutter_5iwj_2024/core/exceptions/app_exception.dart';
import 'package:flutter_5iwj_2024/core/models/cart_line.dart';
import 'package:flutter_5iwj_2024/core/models/product.dart';
import 'package:flutter_5iwj_2024/core/services/cart_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<CartLinesLoaded>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));

      try {
        final lines = await CartService.getAll();
        emit(state.copyWith(status: CartStatus.success, lines: lines));
      } on AppException catch (error) {
        emit(state.copyWith(status: CartStatus.error, errorMessage: error.message));
      } catch (error) {
        emit(state.copyWith(status: CartStatus.error, errorMessage: 'An unknown error occurred'));
      }
    });

    on<CartLineAdded>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));

      try {
        final lines = await CartService.add(product: event.product);
        emit(state.copyWith(status: CartStatus.success, lines: lines));
      } on AppException catch (error) {
        emit(state.copyWith(status: CartStatus.error, errorMessage: error.message));
      } catch (error) {
        emit(state.copyWith(status: CartStatus.error, errorMessage: 'An unknown error occurred'));
      }
    });

    on<CartLineRemoved>((event, emit) async {
      emit(state.copyWith(status: CartStatus.loading));

      try {
        final lines = await CartService.remove(productId: event.productId);
        emit(state.copyWith(status: CartStatus.success, lines: lines));
      } on AppException catch (error) {
        emit(state.copyWith(status: CartStatus.error, errorMessage: error.message));
      } catch (error) {
        emit(state.copyWith(status: CartStatus.error, errorMessage: 'An unknown error occurred'));
      }
    });
  }
}
