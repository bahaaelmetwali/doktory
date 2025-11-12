import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/shared/appointment/data/models/appointment_model.dart';
import 'package:doktory/features/shared/appointment/domain/repo/appointments_repository.dart';

class GetAppointmentsForUserUseCase {
  final AppointmentsRepository _appointmentsRepository;
  GetAppointmentsForUserUseCase(this._appointmentsRepository);
  Future<Either<Failure, List<AppointmentModel>>> call(String userId) {
    return _appointmentsRepository.getAppointmentsForUser(userId);
  }
}
