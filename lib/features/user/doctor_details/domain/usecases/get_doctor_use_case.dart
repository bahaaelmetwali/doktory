import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/domain/repo/user_repository.dart';

class GetDoctorDataUseCase {
  final UserRepository repository;

  GetDoctorDataUseCase(this.repository);

  Future<Either<Failure, UserModel?>> call(String doctorId) async {
    return repository.getUserData(uid: doctorId);
  }
}
