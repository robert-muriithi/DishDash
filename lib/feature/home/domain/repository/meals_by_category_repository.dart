import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/feature/home/domain/models/meal_by_category_model.dart';
import 'package:DishDash/feature/home/domain/models/meal_details.dart';
import 'package:dartz/dartz.dart';

abstract class MealByCategoryRepository {
  Future<Either<Failure, List<MealByCategoryModel>>> getMealByCategory(String category);
  Future<Either<Failure, List<MealDetailsModel> >> getMealDetails(String id);
}