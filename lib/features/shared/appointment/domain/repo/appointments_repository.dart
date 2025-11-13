import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/shared/appointment/data/models/appointment_model.dart';

abstract class AppointmentsRepository {
  Future<Either<Failure, void>> addAppointment(AppointmentModel appointment);
  Future<Either<Failure, List<AppointmentModel>>> getAppointmentsForUser(
    String userId,
  );
  Future<Either<Failure, List<AppointmentModel>>> getAppointmentsForDoctor(
    String doctorId,
  );
  Future<Either<Failure, void>> updateAppointmentStatus(
    String appointmentId,
    String newStatus,
    String? rejectionReason,
  );
}
