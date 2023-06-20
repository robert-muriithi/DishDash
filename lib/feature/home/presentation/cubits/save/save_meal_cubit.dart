import 'package:DishDash/core/utils/utils.dart';
import 'package:DishDash/feature/home/domain/usecase/save_meal_usecase.dart';
import 'package:DishDash/feature/saved/domain/models/saved_food_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'save_meal_state.dart';

class SaveMealCubit extends Cubit<SaveMealState> {
  final SaveMealUseCase saveMealUseCase;
  SaveMealCubit(this.saveMealUseCase) : super(const SaveMealState());


  Future<void> saveMeal(SavedFoodModel meal) async {
    try{
      final result = await saveMealUseCase(meal);
      result.fold(
        (failure) => emit(state.copyWith(errorMsg: mapFailureToMessage(failure))),
        (success) => emit(state.copyWith(isSaved: true, errorMsg: null, /*savedFoodModel: meal*/))
      );
    } catch(e){
      emit(state.copyWith(errorMsg: e.toString()));
    }
  }


}
