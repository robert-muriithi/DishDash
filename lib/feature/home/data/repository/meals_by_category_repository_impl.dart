import 'package:DishDash/core/errors/exceptions.dart';
import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/network/network.dart';
import 'package:DishDash/feature/home/data/datasources/remote/meal_by_category_remote_data_source.dart';
import 'package:DishDash/feature/home/domain/models/meal_by_category_model.dart';
import 'package:DishDash/feature/home/domain/models/meal_details.dart';
import 'package:DishDash/feature/home/domain/repository/meals_by_category_repository.dart';
import 'package:dartz/dartz.dart';

class MealByCategoryRepositoryImpl implements MealByCategoryRepository {
  final NetworkInfo networkInfo;
  final MealByCategoryRemoteDataSource remoteDataSource;
  MealByCategoryRepositoryImpl(this.networkInfo, this.remoteDataSource);

  @override
  Future<Either<Failure, List<MealByCategoryModel>>> getMealByCategory(String category) async {
    if(await networkInfo.isConnected()){
      try{
        final remoteMeals = await remoteDataSource.getMealByCategory(category);
        final meals = remoteMeals.meals;
        return Right(meals);
      }
      on ServerException catch(e){
        return Left(ServerFailure(e.message));
      }
    }else {
      return const Left(ServerFailure('No Internet Connection'));
    }

  }

  @override
  Future<Either<Failure, List<MealDetailsModel>>> getMealDetails(String id) async {
    if(await networkInfo.isConnected()){
      try{
        final remoteMeals = await remoteDataSource.getMealDetails(id);
        final meals = remoteMeals.meals;
         return Right(meals ?? []);
      }
      on ServerException catch(e){
        return Left(ServerFailure(e.message));
      }
    }else {
      return const Left(ServerFailure('No Internet Connection'));
    }
  }

}