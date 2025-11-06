import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/domain/repo/user_repository.dart';

class GetUserDataUseCase {
  final UserRepository _repository;
  GetUserDataUseCase(this._repository);
  Future<Either<Failure, UserModel?>> call({required String uid}) async {
    return await _repository.getUserData(uid: uid);
  }
}
