

import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/usecase/usecase.dart';
import 'package:DishDash/feature/home/domain/models/categories_model.dart';
import 'package:DishDash/feature/home/domain/repository/categories_repository.dart';
import 'package:dartz/dartz.dart';

class GetFoodCategoriesUsCase extends UseCase<List<CategoriesModel>, NoParams>{
  final FoodCategoriesRepository repository;
  GetFoodCategoriesUsCase(this.repository);

  @override
  Future<Either<Failure, List<CategoriesModel>>> call(NoParams params) {
    return repository.getFoodCategories();
  }


}