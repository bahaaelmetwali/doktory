import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/domain/repo/auth_repository.dart';
import 'package:doktory/features/shared/auth/domain/repo/user_repository.dart';

class GetFullUserDataUseCase {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  GetFullUserDataUseCase(this.authRepository, this.userRepository);

  Future<Either<Failure, UserModel?>> call() async {
    final authResult = await authRepository.getUser();
    return await authResult.fold((failure) => Left(failure), (userModel) async {
      if (userModel == null) return const Right(null);
      return await userRepository.getUserData(uid: userModel.uid);
    });
  }
}
