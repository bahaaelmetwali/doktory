import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/core/utils/handle_request.dart';
import 'package:doktory/features/shared/auth/data/data_source/auth_remote_data_source.dart';
import 'package:doktory/features/shared/auth/data/models/auth_request_model.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/domain/repo/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepositoryImpl(this._authRemoteDataSource);

  @override
  Future<Either<Failure, UserModel?>> register(AuthRequestModel model) {
    return handleRequest<UserModel?>(
      request: () async {
        final user = await _authRemoteDataSource.register(
          email: model.email,
          password: model.password,
        );
        if (user == null) return null;

        final userModel = UserModel.fromFirebaseUser(user);

        return userModel;
      },
    );
  }

  @override
  Future<Either<Failure, UserModel?>> logIn(AuthRequestModel model) {
    return handleRequest(
      request: () async {
        final user = await _authRemoteDataSource.login(
          email: model.email,
          password: model.password,
        );
        if (user == null) return null;
        return UserModel.fromFirebaseUser(user);
      },
    );
  }

  @override
  Future<Either<Failure, UserModel?>> getUser() {
    return handleRequest(
      request: () async {
        final user = _authRemoteDataSource.getCurrentUser();
        if (user == null) return null;
        return UserModel.fromFirebaseUser(user);
      },
    );
  }

  @override
  Future<Either<Failure, void>> logout() async {
    return handleRequest(
      request: () async {
        await _authRemoteDataSource.logout();
      },
    );
  }
}
