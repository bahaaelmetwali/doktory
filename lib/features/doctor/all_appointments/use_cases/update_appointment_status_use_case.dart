import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/shared/appointment/domain/repo/appointments_repository.dart';

class UpdateAppointmentStatusUseCase {
  final AppointmentsRepository _repository;

  UpdateAppointmentStatusUseCase(this._repository);

  Future<Either<Failure, void>> call(
    String appointmentId,
    String newStatus, {
    String? rejectionReason,
  }) async {
    return _repository.updateAppointmentStatus(
      appointmentId,
      newStatus,
      rejectionReason,
    );
  }
}
