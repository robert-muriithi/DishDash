

import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/usecase/usecase.dart';
import 'package:DishDash/feature/saved/domain/repository/saved_meals_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteSavedUseCase extends UseCase<void, Params>{
  final SavedMealsRepository repository;
  DeleteSavedUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(Params params) {
    return repository.deleteSavedMeal(params.id as String);
  }
}