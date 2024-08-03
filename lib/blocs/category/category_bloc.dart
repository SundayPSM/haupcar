import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:haupcar_assignment/models/category_model.dart';
import 'package:haupcar_assignment/services/api_services.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ApiService apiService;
  CategoryBloc(this.apiService) : super(CategoryState()) {
    on<InitialCategoryEvent>(
      (event, emit) async {
        try {
          final categories = await apiService.fetchCategories();
          emit(
            state.copyWith(
              categoryStatus: CategoryStatus.success,
              categories: categories,
            ),
          );
        } catch (e) {
          emit(
            state.copyWith(
              categoryStatus: CategoryStatus.failure,
              errorMsg: "Can not fetch categories",
            ),
          );
        }
      },
    );
    on<OnCategorySelectedEvent>((event, emit) {
      emit(
        state.copyWith(
          selectedCategory: event.selectedCategory,
        ),
      );
    });
  }
}
