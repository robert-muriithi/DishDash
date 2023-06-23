

import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/usecase/usecase.dart';
import 'package:DishDash/feature/saved/domain/models/saved_food_model.dart';
import 'package:DishDash/feature/saved/domain/repository/saved_meals_repository.dart';
import 'package:dartz/dartz.dart';

class GetSavedMealsUseCase extends UseCase<List<SavedFoodModel>, NoParams>{
  final SavedMealsRepository repository;
  GetSavedMealsUseCase(this.repository);

  @override
  Future<Either<Failure, List<SavedFoodModel>>> call(NoParams params) {
    return repository.getSavedMeals();
  }
}