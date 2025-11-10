import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/user/doctor_details/data/models/appointment_model.dart';
import 'package:doktory/features/user/doctor_details/domain/repo/appointments_repository.dart';

class AddAppointmentUseCase {
  final AppointmentsRepository _appointmentsRepository;
  AddAppointmentUseCase(this._appointmentsRepository);
  Future<Either<Failure, void>> call(AppointmentModel appointment) async {
    return await _appointmentsRepository.addAppointment(appointment);
  }
}
