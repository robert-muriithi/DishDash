
import 'package:DishDash/core/errors/exceptions.dart';
import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/network/network.dart';
import 'package:DishDash/feature/home/data/datasources/remote/categories_remote_data_source.dart';
import 'package:DishDash/feature/home/domain/models/categories_model.dart';
import 'package:DishDash/feature/home/domain/repository/categories_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

class FoodCategoriesRepositoryImpl implements FoodCategoriesRepository {
  final CategoriesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  FoodCategoriesRepositoryImpl(this.remoteDataSource, this.networkInfo);

  @override
  Future<Either<Failure, List<CategoriesModel>>> getFoodCategories() async {
    final log = Logger();
    if(await networkInfo.isConnected()){
      try{
        final remoteCategories = await remoteDataSource.getMealCategories();
        final categories = remoteCategories.categories;
        return Right(categories);
      }
      on ServerException catch(e){
        log.e(e.message);
        return Left(ServerFailure(e.message));
      }
    }else {
      return const Left(ServerFailure('No Internet Connection'));
    }
  }
}