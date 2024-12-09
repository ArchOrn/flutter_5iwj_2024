import 'package:flutter/foundation.dart';
import 'package:flutter_5iwj_2024/core/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState()) {
    on<ProductEvent>((event, emit) {
      emit(state.copyWith(status: ProductStatus.loading));

      // TODO
    });
  }
}
