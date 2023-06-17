

import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/usecase/usecase.dart';
import 'package:DishDash/feature/home/domain/models/meal_by_category_model.dart';
import 'package:DishDash/feature/home/domain/models/meal_details.dart';
import 'package:DishDash/feature/home/domain/repository/meals_by_category_repository.dart';
import 'package:dartz/dartz.dart';

class GetMealDetailsUseCase extends UseCase<List<MealDetailsModel>, Params>{
  final MealByCategoryRepository repository;
  GetMealDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, List<MealDetailsModel>>> call(params) {
    return repository.getMealDetails(params.id as String);
  }
}

