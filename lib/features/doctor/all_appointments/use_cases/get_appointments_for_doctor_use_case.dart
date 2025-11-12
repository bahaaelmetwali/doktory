import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/shared/appointment/data/models/appointment_model.dart';
import 'package:doktory/features/shared/appointment/domain/repo/appointments_repository.dart';

class GetAppointmentsForDoctorUseCase {
  final AppointmentsRepository _repository;
  GetAppointmentsForDoctorUseCase(this._repository);

  Future<Either<Failure, List<AppointmentModel>>> call(String doctorId) async {
    return await _repository.getAppointmentsForDoctor(doctorId);
  }
}
