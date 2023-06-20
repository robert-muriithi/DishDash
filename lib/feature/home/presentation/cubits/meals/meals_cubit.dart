import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/home/domain/models/meal_by_category_model.dart';
import 'package:DishDash/feature/home/domain/usecase/get_meal_by_category_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  final GetMealsByCategoryUseCase getMealsByCategoryUseCase;

  MealsCubit(this.getMealsByCategoryUseCase) : super(const MealsState());


  Future<void> fetchMealsByCategory(String category) async {
    emit(state.copyWith(uiState: UIState.loading));
    try {
      final result = await getMealsByCategoryUseCase(Params(category: category));
      result.fold(
          (failure) => emit(state.copyWith(
              uiState: UIState.error, exception: mapFailureToMessage(failure))),
          (data) =>
              emit(state.copyWith(uiState: UIState.success, meals: data)));
    } on Exception catch (e) {
      emit(state.copyWith(uiState: UIState.error, exception: e.toString()));
    }
  }

  void onSelected(String category) {
    fetchMealsByCategory(category);
  }

  void getItemCount(int count) {
    emit(state.copyWith(itemCount: count));
  }

}
