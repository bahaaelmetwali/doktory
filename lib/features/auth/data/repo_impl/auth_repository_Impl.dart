import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/core/utils/handle_request.dart';
import 'package:doktory/features/auth/data/data_source/firebase_auth_service.dart';
import 'package:doktory/features/auth/data/models/auth_request_model.dart';
import 'package:doktory/features/auth/data/models/user_model.dart';
import 'package:doktory/features/auth/domain/repo/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService authService;

  AuthRepositoryImpl(this.authService);

  @override
  Future<Either<Failure, UserModel?>> register(AuthRequestModel model) {
    return handleRequest<UserModel?>(
      request: () async {
        final user = await authService.registerWithEmail(
          email: model.email,
          password: model.password,
        );
        if (user == null) return null;

        return UserModel.fromFirebaseUser(user);
      },
    );
  }
}
