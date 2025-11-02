import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/core/utils/handle_request.dart';
import 'package:doktory/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:doktory/features/auth/data/data_source/user_remote_data_source.dart';
import 'package:doktory/features/auth/data/models/auth_request_model.dart';
import 'package:doktory/features/auth/data/models/user_model.dart';
import 'package:doktory/features/auth/domain/repo/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
    final UserRemoteDataSource _userRemoteDataSource;


  AuthRepositoryImpl(this._authRemoteDataSource, this._userRemoteDataSource);

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
        await _userRemoteDataSource.createUser(userModel);

        return userModel;

      },
    );
  }
  
  @override
  Future<Either<Failure, UserModel?>> logIn(AuthRequestModel model) {
return handleRequest(request: ()async{
  final user = await _authRemoteDataSource.login(
    email: model.email,
    password: model.password,
  );
  if (user == null) return null;
  return UserModel.fromFirebaseUser(user); 
})   ;}
}
