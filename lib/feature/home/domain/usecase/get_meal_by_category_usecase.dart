import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/usecase/usecase.dart';
import 'package:DishDash/feature/home/domain/models/meal_by_category_model.dart';
import 'package:DishDash/feature/home/domain/repository/meals_by_category_repository.dart';
import 'package:dartz/dartz.dart';

class GetMealsByCategoryUseCase extends UseCase<List<MealByCategoryModel>, Params>{
  final MealByCategoryRepository repository;
  GetMealsByCategoryUseCase(this.repository);

  @override
  Future<Either<Failure, List<MealByCategoryModel>>> call(params) {
    return repository.getMealByCategory(params.category!);
  }
}