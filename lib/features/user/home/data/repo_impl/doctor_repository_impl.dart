import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/core/utils/handle_request.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/user/home/data/data_source/doctor_remote_data_source.dart';
import 'package:doktory/features/user/home/domain/repo/doctor_repository.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final DoctorRemoteDataSource _doctorRemoteDataSource;

  DoctorRepositoryImpl(this._doctorRemoteDataSource);

  @override
  Future<Either<Failure, List<UserModel>>> getDoctors() {
    return handleRequest(
      request: () async {
        final doctors = await _doctorRemoteDataSource.getDoctors();
        return doctors;
      },
    );
  }
}
