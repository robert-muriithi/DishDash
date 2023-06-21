import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/saved/domain/models/saved_food_model.dart';
import 'package:DishDash/feature/saved/domain/repository/saved_meals_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'saved_meals_state.dart';

class SavedMealsCubit extends Cubit<SavedMealsState> {
  final SavedMealsRepository repository;
  SavedMealsCubit(this.repository) : super(const SavedMealsState());

  Future<void> getSavedMeals() async {
    emit(state.copyWith(uiState: UIState.loading));
    try{
      final result = await repository.getSavedMeals();
      result.fold(
              (failure) => emit(state.copyWith(uiState: UIState.error, errorMessage: mapFailureToMessage(failure))),
              (meals) => emit(state.copyWith(uiState: UIState.success, savedMeals : meals))
      );
    } catch(e){
      emit(state.copyWith(uiState: UIState.error, errorMessage: e.toString()));
    }
  }

  Future<void> deleteSavedMeal(String mealId) async {
    emit(state.copyWith(uiState: UIState.loading));
    try{
      final result = await repository.deleteSavedMeal(mealId);
      result.fold(
              (failure) => emit(state.copyWith(uiState: UIState.error, errorMessage: mapFailureToMessage(failure))),
              (_) => emit(state.copyWith(uiState: UIState.success))
      );
    } catch(e){
      emit(state.copyWith(uiState: UIState.error, errorMessage: e.toString()));
    }
  }

}
