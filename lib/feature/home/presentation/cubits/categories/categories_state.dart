part of 'categories_cubit.dart';

class CategoriesState extends Equatable {
  final String? exception;
  final UIState uiState;
  final int selectedIndex;
  final List<CategoriesModel> categories;
  final List<MealByCategoryModel> meals;
  const CategoriesState({this.exception, this.uiState = UIState.initial, this.categories = const [], this.selectedIndex = 0, this.meals = const []});

  @override
  List<Object?> get props => [uiState, categories, exception, selectedIndex, meals];


  CategoriesState copyWith({
    String? exception,
    UIState? uiState,
    int? selectedIndex,
    List<CategoriesModel>? categories,
    List<MealByCategoryModel>? meals,
  }) {
    return CategoriesState(
      exception: exception ?? this.exception,
      uiState: uiState ?? this.uiState,
      categories: categories ?? this.categories,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      meals: meals ?? this.meals,
    );
  }
}


