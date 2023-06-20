part of 'save_meal_cubit.dart';

class SaveMealState extends Equatable {
  final String? errorMsg;
  final bool isSaved;

  /*final SavedFoodModel? savedFoodModel;*/

 const SaveMealState({this.errorMsg, this.isSaved = false, /*this.savedFoodModel*/});

  @override
  List<Object?> get props => [errorMsg, isSaved, /*savedFoodModel*/];

  SaveMealState copyWith({
    String? errorMsg,
    bool? isSaved,
    SavedFoodModel? savedFoodModel
  }) {
    return SaveMealState(
      errorMsg: errorMsg ?? this.errorMsg,
      isSaved: isSaved ?? this.isSaved,
      /*savedFoodModel: savedFoodModel ?? this.savedFoodModel,*/
    );
  }

}


