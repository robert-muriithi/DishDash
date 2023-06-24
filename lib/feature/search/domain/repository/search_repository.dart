import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/feature/search/domain/model/search_results_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchResultsModel>>> searchMeal(String query);
}