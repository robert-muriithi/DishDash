

import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/feature/saved/domain/models/saved_food_model.dart';
import 'package:dartz/dartz.dart';

abstract class SavedMealsRepository {
  Future<Either<Failure, List<SavedFoodModel>>> getSavedMeals();
  Future<Either<Failure, void>> deleteSavedMeal(String mealId);
  Future<Either<Failure, void>> insertSavedMeal(SavedFoodModel meal);
}