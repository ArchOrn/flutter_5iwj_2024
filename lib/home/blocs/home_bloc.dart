import 'package:flutter/foundation.dart';
import 'package:flutter_5iwj_2024/core/exceptions/app_exception.dart';
import 'package:flutter_5iwj_2024/core/models/product.dart';
import 'package:flutter_5iwj_2024/core/services/api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductsLoaded>((event, emit) async {
      emit(HomeLoading());

      try {
        final products = await ApiServices.getProducts();
        emit(HomeSuccess(products: products));
      } on AppException catch (error) {
        emit(HomeError(errorMessage: error.message));
      } catch (error) {
        emit(HomeError(errorMessage: 'An unknown error occurred'));
      }
    });
  }
}
