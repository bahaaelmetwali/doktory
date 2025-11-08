import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/core/utils/handle_request.dart';
import 'package:doktory/features/shared/auth/data/data_source/user_remote_data_source.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/domain/repo/user_repository.dart';

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
    required UserModel user,
    File? imageFile,
  }) {
    return handleRequest(
      request: () async {
        String? imageUrl;
        if (imageFile != null) {
          imageUrl = await _userRemoteDataSource.uploadProfileImage(
            uid: user.uid,
            imageFile: imageFile,
          );
        }
        final userMap = user.toMap();
        userMap['image'] = imageUrl;
        await _userRemoteDataSource.updateUser(uid: user.uid, data: userMap);
      },
    );
  }

  @override
  Future<Either<Failure, UserModel?>> getUserData({required String uid}) {
    return handleRequest(
      request: () async {
        UserModel? user = await _userRemoteDataSource.getUser(uid: uid);
        return user;
      },
    );
  }
}
