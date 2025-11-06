import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, void>> createUser(UserModel user);
  Future<Either<Failure, void>> completeUserData({required UserModel user});
  Future<Either<Failure, UserModel?>> getUserData({required String uid});
}
