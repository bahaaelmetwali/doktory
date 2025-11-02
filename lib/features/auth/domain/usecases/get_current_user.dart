import 'package:doktory/features/auth/data/models/user_model.dart';
import 'package:doktory/features/auth/domain/repo/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository _repository;

  GetCurrentUserUseCase(this._repository);

  Future<UserModel?> call() async {
    final user = await _repository.getUser();
    return user; 
  }
}