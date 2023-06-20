import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/usecase/usecase.dart';
import 'package:DishDash/feature/saved/domain/models/saved_food_model.dart';
import 'package:DishDash/feature/saved/domain/repository/saved_meals_repository.dart';
import 'package:dartz/dartz.dart';

class SaveMealUseCase extends UseCase<void, SavedFoodModel>{
  final SavedMealsRepository repository;
  SaveMealUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(params) {
    return repository.insertSavedMeal(params);
  }
}