import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/usecase/usecase.dart';
import 'package:DishDash/feature/search/domain/model/search_results_model.dart';
import 'package:DishDash/feature/search/domain/repository/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchMealUseCase extends UseCase<List<SearchResultsModel>, String> {
  final SearchRepository searchRepository;
  SearchMealUseCase(this.searchRepository);

  @override
  Future<Either<Failure, List<SearchResultsModel>>> call(String query) {
    return searchRepository.searchMeal(query);
  }
}