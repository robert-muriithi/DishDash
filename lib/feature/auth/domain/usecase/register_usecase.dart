

import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/usecase/usecase.dart';
import 'package:DishDash/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class RegisterUseCase extends UseCase<String, LoginParams> {
  final AuthRepository authRepository;
  RegisterUseCase(this.authRepository);

  @override
  Future<Either<Failure, String>> call(LoginParams params) {
    return authRepository.register(password: params.password, email: params.email);
  }
}