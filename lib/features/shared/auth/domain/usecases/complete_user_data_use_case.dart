import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/domain/repo/user_repository.dart';

class CompleteUserDataUseCase {
  final UserRepository _userRepository;
  CompleteUserDataUseCase(this._userRepository);
  Future<Either<Failure, void>> call({required UserModel user}) async {
    return await _userRepository.completeUserData(user: user);
  }
}
