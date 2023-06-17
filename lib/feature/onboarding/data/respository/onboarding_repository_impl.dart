import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/feature/onboarding/data/datasource/sharedprefs_local_data_source.dart';
import 'package:DishDash/feature/onboarding/domain/respository/onboarding_repository.dart';
import 'package:dartz/dartz.dart';

class OnBoardingScreensRepositoryImpl implements OnBoardingScreensRepository {
  final OnBoardingLocalDataSource localDataSource;
  OnBoardingScreensRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, void>> setOnBoardingStatus(bool isCompleted) async {
    try {
      await localDataSource.setOnBoardingStatus(isCompleted);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

}