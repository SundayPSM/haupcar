// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_bloc.dart';

enum CategoryStatus {
  initial,
  loading,
  success,
  failure,
}

class CategoryState extends Equatable {
  final CategoryStatus categoryStatus;
  final String errorMsg;
  final List<CategoryModel> categories;
  final CategoryModel? selectedCategory;

  CategoryState({
    this.categoryStatus = CategoryStatus.initial,
    this.errorMsg = "Something went wrong",
    this.categories = const [],
    this.selectedCategory,
  });
  @override
  List<Object?> get props => [categoryStatus, errorMsg, categories, selectedCategory];

  CategoryState copyWith({
    CategoryStatus? categoryStatus,
    String? errorMsg,
    List<CategoryModel>? categories,
    CategoryModel? selectedCategory,
  }) {
    return CategoryState(
      categoryStatus: categoryStatus ?? this.categoryStatus,
      errorMsg: errorMsg ?? this.errorMsg,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
