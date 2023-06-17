import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/home/domain/models/categories_model.dart';
import 'package:DishDash/feature/home/domain/models/meal_by_category_model.dart';
import 'package:DishDash/feature/home/domain/usecase/get_food_categories_usecase.dart';
import 'package:DishDash/feature/home/domain/usecase/get_meal_by_category_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetFoodCategoriesUsCase getFoodCategoriesUsCase;
  final GetMealsByCategoryUseCase getMealsByCategoryUseCase;

  CategoriesCubit(this.getFoodCategoriesUsCase, this.getMealsByCategoryUseCase)
      : super(const CategoriesState());

  Future<void> fetchFoodCategories() async {
    emit(state.copyWith(uiState: UIState.loading, selectedIndex: 0));
    try {
      final result = await getFoodCategoriesUsCase(NoParams());
      result.fold(
          (failure) => emit(state.copyWith(
              uiState: UIState.error, exception: mapFailureToMessage(failure))),
          (data) {
            emit(state.copyWith(uiState: UIState.success, categories: data));
            Future.delayed(const Duration(milliseconds: 500), () => onSelected(0));
            fetchMealsByCategory(data[0].strCategory);
          });
    } on Exception catch (e) {
      emit(state.copyWith(uiState: UIState.error, exception: e.toString()));
    }
  }

  void onSelected(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  Future<void> fetchMealsByCategory(String category) async {
    emit(state.copyWith(uiState: UIState.loading));
    try {
      final result = await getMealsByCategoryUseCase(Params(category: category));
      result.fold(
          (failure) => emit(state.copyWith(
              uiState: UIState.error, exception: mapFailureToMessage(failure))),
          (data) => emit(state.copyWith(uiState: UIState.success, meals: data)));
    } on Exception catch (e) {
      emit(state.copyWith(uiState: UIState.error, exception: e.toString()));
    }
  }
}
