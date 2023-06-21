
import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/feature/auth/domain/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel>> login({required String email, required String password});
  Future<Either<Failure, String>> register({required String email, required String password});
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, String?>> getCurrentUser();
  Future<Either<Failure, UserModel>> signInWithGoogle();
  Future<Either<Failure, void>> sendPasswordResetEmail({required String email});
}