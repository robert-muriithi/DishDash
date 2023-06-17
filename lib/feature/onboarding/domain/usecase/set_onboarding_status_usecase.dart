import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/usecase/usecase.dart';
import 'package:DishDash/feature/onboarding/domain/respository/onboarding_repository.dart';
import 'package:dartz/dartz.dart';

class SetOnboardingStatusUsCase extends UseCase<void, NoParams>{
  final OnBoardingScreensRepository repository;
  SetOnboardingStatusUsCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params)  {
    return repository.setOnBoardingStatus(true);
  }

}