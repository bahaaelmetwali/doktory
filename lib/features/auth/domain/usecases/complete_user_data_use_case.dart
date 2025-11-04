import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/auth/domain/repo/user_repository.dart';

class CompleteUserDataUseCase {
  final UserRepository _userRepository;
  CompleteUserDataUseCase(this._userRepository);
  Future<Either<Failure, void>> call({
    required String uid,
    required Map<String, dynamic> data,
  }) async {
    return await _userRepository.completeUserData(uid: uid, data: data);
  }
}
