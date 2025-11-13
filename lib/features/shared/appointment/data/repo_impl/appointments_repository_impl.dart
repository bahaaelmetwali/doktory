import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/core/utils/handle_request.dart';
import 'package:doktory/features/shared/appointment/data/data_source/appointment_data_source.dart';
import 'package:doktory/features/shared/appointment/data/models/appointment_model.dart';
import 'package:doktory/features/shared/appointment/domain/repo/appointments_repository.dart';

class AppointmentsRepositoryImpl implements AppointmentsRepository {
  final AppointmentsRemoteDataSource _remoteDataSource;

  AppointmentsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, void>> addAppointment(AppointmentModel appointment) {
    return handleRequest(
      request: () async {
        await _remoteDataSource.addAppointment(appointment);
      },
    );
  }

  @override
  Future<Either<Failure, List<AppointmentModel>>> getAppointmentsForUser(
    String userId,
  ) {
    return handleRequest(
      request: () async {
        return await _remoteDataSource.getAppointmentsForUser(userId);
      },
    );
  }

  @override
  Future<Either<Failure, List<AppointmentModel>>> getAppointmentsForDoctor(
    String doctorId,
  ) {
    return handleRequest(
      request: () async {
        return await _remoteDataSource.getAppointmentsForDoctor(doctorId);
      },
    );
  }

  @override
  Future<Either<Failure, void>> updateAppointmentStatus(
    String appointmentId,
    String newStatus,
    String? rejectionReason,
  ) {
    return handleRequest(
      request: () async {
        await _remoteDataSource.updateAppointmentStatus(
          appointmentId,
          newStatus,
          rejectionReason: rejectionReason,
        );
      },
    );
  }
}
