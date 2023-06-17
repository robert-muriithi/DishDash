
import 'package:DishDash/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class OnBoardingScreensRepository {
  Future<Either<Failure, void>> setOnBoardingStatus(bool isCompleted);
}