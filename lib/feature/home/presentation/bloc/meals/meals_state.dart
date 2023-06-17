part of 'meals_cubit.dart';

class MealsState extends Equatable {
  final String? exception;
  final UIState uiState;
  final List<MealByCategoryModel> meals;
  final int selectedIndex;
  final int itemCount;
  const MealsState({this.exception, this.uiState = UIState.initial, this.meals = const [], this.selectedIndex = 0, this.itemCount = 0});

  @override
  List<Object?> get props => [uiState, meals, exception, selectedIndex, itemCount];

  MealsState copyWith({
    String? exception,
    UIState? uiState,
    List<MealByCategoryModel>? meals,
    int? itemCount,
  }) {
    return MealsState(
      exception: exception ?? this.exception,
      uiState: uiState ?? this.uiState,
      meals: meals ?? this.meals,
      itemCount: itemCount ?? this.itemCount,
    );
  }


}

