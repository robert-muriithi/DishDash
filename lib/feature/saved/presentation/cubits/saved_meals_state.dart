part of 'saved_meals_cubit.dart';

class SavedMealsState extends Equatable {
  final String? errorMessage;
  final List<SavedFoodModel>? savedMeals;
  final UIState uiState;
  const SavedMealsState({
    this.errorMessage,
    this.savedMeals,
    this.uiState = UIState.initial,
  });

  @override
  List<Object?> get props => [errorMessage, savedMeals, uiState];

  SavedMealsState copyWith({
    String? errorMessage,
    List<SavedFoodModel>? savedMeals,
    UIState? uiState,
  }) {
    return SavedMealsState(
      errorMessage: errorMessage ?? this.errorMessage,
      savedMeals: savedMeals ?? this.savedMeals,
      uiState: uiState ?? this.uiState,
    );
  }
}

