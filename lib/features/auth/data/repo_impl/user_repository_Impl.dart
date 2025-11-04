import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/core/utils/handle_request.dart';
import 'package:doktory/features/auth/data/data_source/user_remote_data_source.dart';
import 'package:doktory/features/auth/data/models/user_model.dart';
import 'package:doktory/features/auth/domain/repo/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  UserRepositoryImpl(this._userRemoteDataSource);

  @override
  Future<Either<Failure, void>> createUser(UserModel user) async {
    return handleRequest(
      request: () async {
        await _userRemoteDataSource.createUser(user);
      },
    );
  }

  @override
  Future<Either<Failure, void>> completeUserData({
    required String uid,
    required Map<String, dynamic> data,
  }) {
    return handleRequest(
      request: () async {
        await _userRemoteDataSource.updateUser(uid: uid, data: data);
      },
    );
  }
}
