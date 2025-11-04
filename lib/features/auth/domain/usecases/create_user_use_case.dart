import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/auth/data/models/user_model.dart';
import 'package:doktory/features/auth/domain/repo/user_repository.dart';

class CreateUserUseCase {
  final UserRepository _userRepository;
  CreateUserUseCase(this._userRepository);
  Future<Either<Failure, void>> call(UserModel user) async {
    return await _userRepository.createUser(user);
  }
}
