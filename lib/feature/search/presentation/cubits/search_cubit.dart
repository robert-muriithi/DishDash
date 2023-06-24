import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/search/domain/model/search_results_model.dart';
import 'package:DishDash/feature/search/domain/usecase/search_meal_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMealUseCase searchMealUseCase;
  SearchCubit(this.searchMealUseCase) : super(const SearchState());

  Future<void> searchMeal(String query) async {
    emit(state.copyWith(uiState: UIState.loading));
    final result = await searchMealUseCase(query);
    result.fold(
      (failure) => emit(state.copyWith(uiState: UIState.error, message: mapFailureToMessage(failure))),
      (meals) => emit(state.copyWith(uiState: UIState.success, results: meals)),
    );
  }
}
