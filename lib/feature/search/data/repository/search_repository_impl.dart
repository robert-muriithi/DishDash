
import 'package:DishDash/core/errors/exceptions.dart';
import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/feature/search/data/datasource/search_remote_data_source.dart';
import 'package:DishDash/feature/search/domain/model/search_results_model.dart';
import 'package:DishDash/feature/search/domain/repository/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepositoryImpl(this.searchRemoteDataSource);

  @override
  Future<Either<Failure, List<SearchResultsModel>>> searchMeal(String query) async {
    try{
      final response = await searchRemoteDataSource.searchMeal(query);
      return Right(response.meals);
    } on ServerException catch (exception){
      return Left(ServerFailure(exception.message));
    }
  }

}