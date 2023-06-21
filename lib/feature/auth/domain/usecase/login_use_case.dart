

import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/usecase/usecase.dart';
import 'package:DishDash/feature/auth/domain/model/user_model.dart';
import 'package:DishDash/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase extends UseCase<UserModel, LoginParams> {
  final AuthRepository authRepository;
  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, UserModel>> call(LoginParams params) {
    return authRepository.login(password: params.password, email: params.email);
  }
}