

import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/usecase/usecase.dart';
import 'package:DishDash/feature/auth/domain/model/user_model.dart';
import 'package:DishDash/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignInWithGoogleUseCase extends UseCase<UserModel, NoParams> {
  final AuthRepository repository;
  SignInWithGoogleUseCase(this.repository);

  @override
  Future<Either<Failure, UserModel>> call(NoParams params) {
    return repository.signInWithGoogle();
  }

}