import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';

abstract class DoctorRepository {
  Future<Either<Failure, List<UserModel>>> getDoctors();
}
