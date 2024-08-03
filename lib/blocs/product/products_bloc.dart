import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:haupcar_assignment/models/product_model.dart';
import 'package:haupcar_assignment/services/api_services.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ApiService apiService;
  ProductsBloc(this.apiService) : super(const ProductsState()) {
    on<FetchProductByCategory>((event, emit) async {
      emit(
        state.copyWith(
          productStatus: ProductStatus.loading,
        ),
      );
      try {
        final products = await apiService.fetchProducts(event.categoryName);
        if (kDebugMode) {
          log(
            products.toString(),
          );
        }
        emit(
          state.copyWith(
            productStatus: ProductStatus.success,
            products: products,
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            productStatus: ProductStatus.failure,
            errorMsg: "Can not products categories",
          ),
        );
      }
    });
  }
}
