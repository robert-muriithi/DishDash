
import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/feature/home/domain/models/categories_model.dart';
import 'package:dartz/dartz.dart';

abstract class FoodCategoriesRepository {
  Future<Either<Failure, List<CategoriesModel>>> getFoodCategories();
}