

import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/core/params/params.dart';
import 'package:DishDash/core/usecase/usecase.dart';
import 'package:DishDash/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordUseCase extends UseCase<void, String> {
  final AuthRepository authRepository;
  ResetPasswordUseCase(this.authRepository);

  @override
  Future<Either<Failure, void>> call(String params) {
    return authRepository.sendPasswordResetEmail(email: params);
  }
}