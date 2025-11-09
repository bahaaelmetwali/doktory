import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/user/doctor_list_screen/domain/repo/doctor_repository.dart';

class GetDoctorsUseCase {
  final DoctorRepository doctorRepository;

  GetDoctorsUseCase(this.doctorRepository);

  Future<Either<Failure, List<UserModel>>> call() async {
    return await doctorRepository.getDoctors();
  }
}
