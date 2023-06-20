import 'dart:async';

import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/home/domain/models/meal_details.dart';
import 'package:DishDash/feature/home/domain/usecase/get_meal_details.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'meal_details_state.dart';

class MealDetailsCubit extends Cubit<MealDetailsState> {
  final GetMealDetailsUseCase getMealDetailsUseCase;
  MealDetailsCubit(this.getMealDetailsUseCase) : super(const MealDetailsState());

  FutureOr<void> fetchMealDetails(String id) async {
    emit(state.copyWith(uiState: UIState.loading));
    try {
      final result = await getMealDetailsUseCase(Params(id: id));
      result.fold(
          (failure) => emit(state.copyWith(
              uiState: UIState.error, exception: mapFailureToMessage(failure))),
          (data) =>
              emit(state.copyWith(uiState: UIState.success, mealDetails: data)));
    } on Exception catch (e) {
      emit(state.copyWith(uiState: UIState.error, exception: e.toString()));
    }
  }

}
