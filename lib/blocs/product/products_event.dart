part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchProductByCategory extends ProductsEvent {
  final String categoryName;

  const FetchProductByCategory({required this.categoryName});
}
