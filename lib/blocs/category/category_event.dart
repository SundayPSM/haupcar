part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class InitialCategoryEvent extends CategoryEvent {}

class OnCategorySelectedEvent extends CategoryEvent {
  final CategoryModel selectedCategory;

  OnCategorySelectedEvent({
    required this.selectedCategory,
  });
}
