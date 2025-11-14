import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/shared/auth/data/models/auth_request_model.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserModel?>> register(AuthRequestModel model);
  Future<Either<Failure, UserModel?>> logIn(AuthRequestModel model);
  Future<Either<Failure, UserModel?>> getUser();
  Future<Either<Failure, void>> logout();
}
