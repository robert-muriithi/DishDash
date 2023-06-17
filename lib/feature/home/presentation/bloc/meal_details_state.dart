part of 'meal_details_cubit.dart';

class MealDetailsState extends Equatable {
  final String? exception;
  final UIState uiState;
  final List<MealDetailsModel> mealDetails;
  const MealDetailsState({this.uiState = UIState.initial, this.exception, this.mealDetails = const []});

  @override
  List<Object?> get props => [exception, uiState, mealDetails];

  MealDetailsState copyWith({
    String? exception,
    UIState? uiState,
    List<MealDetailsModel>? mealDetails
 }) {
    return MealDetailsState(
      exception: exception ?? this.exception,
      uiState: uiState ?? this.uiState,
      mealDetails: mealDetails ?? this.mealDetails,
    );
  }
}


