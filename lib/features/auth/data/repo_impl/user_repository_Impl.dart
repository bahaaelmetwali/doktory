import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/core/utils/handle_request.dart';
import 'package:doktory/features/auth/data/data_source/firestore_user_service.dart';
import 'package:doktory/features/auth/data/models/user_model.dart';
import 'package:doktory/features/auth/domain/repo/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirestoreUserService _firestoreUserService;
  UserRepositoryImpl(this._firestoreUserService);

  @override
  Future<Either<Failure, void>> createUser(UserModel user) async {
    return handleRequest(
      request: () async {
        await _firestoreUserService.createUser(user);
      },
    );
  }
}
