// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'products_bloc.dart';

enum ProductStatus {
  initial,
  loading,
  success,
  failure,
}

class ProductsState extends Equatable {
  const ProductsState({
    this.products = const [],
    this.productStatus = ProductStatus.initial,
    this.errorMsg = "Something went wrong",
  });
  final List<Product> products;
  final ProductStatus productStatus;
  final String errorMsg;

  @override
  List<Object> get props => [products, productStatus, errorMsg];

  ProductsState copyWith({
    List<Product>? products,
    ProductStatus? productStatus,
    String? errorMsg,
  }) {
    return ProductsState(
      products: products ?? this.products,
      productStatus: productStatus ?? this.productStatus,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
