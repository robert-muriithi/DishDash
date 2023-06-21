

import 'package:DishDash/core/errors/exceptions.dart';
import 'package:DishDash/core/errors/failures.dart';
import 'package:DishDash/feature/auth/data/datasource/auth_local_data_source.dart';
import 'package:DishDash/feature/auth/data/datasource/auth_remote_data_source.dart';
import 'package:DishDash/feature/auth/domain/model/user_model.dart';
import 'package:DishDash/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseRemoteDataSource firebaseRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl(this.firebaseRemoteDataSource, this.authLocalDataSource);

  @override
  Future<Either<Failure, String?>> getCurrentUser() async {
    try{
      final user = await firebaseRemoteDataSource.getCurrentUser();
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserModel>> login({required String email, required String password}) async {
    try{
      final user = await firebaseRemoteDataSource.login(email: email, password: password);
      await authLocalDataSource.saveUser(user);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try{
      final user = await firebaseRemoteDataSource.logout();
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> register({required String email, required String password}) async {
    try{
      final user = await firebaseRemoteDataSource.register(email: email, password: password);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail({required String email}) async {
    try{
      final user = await firebaseRemoteDataSource.sendPasswordResetEmail(email: email);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithGoogle() async {
    try{
      final user = await firebaseRemoteDataSource.signInWithGoogle();
      await authLocalDataSource.saveUser(user);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }


}