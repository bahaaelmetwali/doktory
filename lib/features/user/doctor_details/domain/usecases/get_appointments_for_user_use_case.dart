import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/user/doctor_details/data/models/appointment_model.dart';
import 'package:doktory/features/user/doctor_details/domain/repo/appointments_repository.dart';

class GetAppointmentsForUserUseCase {
  final AppointmentsRepository _appointmentsRepository;
  GetAppointmentsForUserUseCase(this._appointmentsRepository);
  Future<Either<Failure, List<AppointmentModel>>> call(String userId) {
    return _appointmentsRepository.getAppointmentsForUser(userId);
  }
}
