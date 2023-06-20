
import 'package:DishDash/core/errors/exceptions.dart';
import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/feature/saved/data/datasource/saved_meals_local_data_source.dart';
import 'package:DishDash/feature/saved/data/mappers/mappers.dart';
import 'package:DishDash/feature/saved/domain/models/saved_food_model.dart';
import 'package:DishDash/feature/saved/domain/repository/saved_meals_repository.dart';
import 'package:dartz/dartz.dart';

class SavedMealsRepositoryImpl implements SavedMealsRepository {
  final SavedMealsLocalDataSource dataSource;
  SavedMealsRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<SavedFoodModel>>> getSavedMeals() async {
    try{
      final response = await dataSource.getAllSavedMeals();
      final results = response.map((e) => e.toModel()).toList();
      return Right(results);
    } on DatabaseException catch(e){
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteSavedMeal(String mealId) async {
    try{
      await dataSource.deleteSavedMeal(mealId);
      return const Right(null);
    } on DatabaseException catch(e){
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> insertSavedMeal(SavedFoodModel meal) async {
    try{
      await dataSource.insertSavedMeal(meal.toEntity());
      return const Right(null);
    } on DatabaseException catch(e){
      return Left(DatabaseFailure(e.message));
    }
  }
}