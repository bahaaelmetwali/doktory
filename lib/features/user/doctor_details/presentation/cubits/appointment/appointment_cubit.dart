import 'package:dartz/dartz.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/user/doctor_details/data/models/appointment_model.dart';
import 'package:doktory/features/user/doctor_details/domain/repo/appointments_repository.dart';
import 'package:doktory/features/user/doctor_details/domain/usecases/get_full_user_data_use_case.dart';
import 'package:uuid/uuid.dart';

part 'appointment_state.dart';

class BookAppointmentUseCase {
  final AppointmentsRepository appointmentsRepository;
  final GetFullUserDataUseCase getFullUserDataUseCase;

  BookAppointmentUseCase({
    required this.appointmentsRepository,
    required this.getFullUserDataUseCase,
  });

  Future<Either<Failure, Unit>> call({
    required AppointmentModel appointmentInput,
  }) async {
    final userResult = await getFullUserDataUseCase();

    return await userResult.fold((failure) => Left(failure), (user) async {
      if (user == null) return Left(Failure('User not logged in'));

      final appointment = AppointmentModel(
        id: const Uuid().v4(),
        doctorId: appointmentInput.doctorId,
        userId: user.uid,
        doctorName: appointmentInput.doctorName,
        userName: user.name,
        appointmentDate: appointmentInput.appointmentDate,
        status: 'pending',
        createdAt: DateTime.now(),
      );
      return await appointmentsRepository.addAppointment(appointment);
    });
  }
}
