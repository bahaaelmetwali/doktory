import 'package:bloc/bloc.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_current_user.dart';
import 'package:doktory/features/user/doctor_details/data/models/appointment_model.dart';
import 'package:doktory/features/user/doctor_details/domain/usecases/add_appointment_use_case.dart';
import 'package:uuid/uuid.dart';

part 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AddAppointmentUseCase addAppointmentUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  AppointmentCubit({
    required this.addAppointmentUseCase,
    required this.getCurrentUserUseCase,
  }) : super(AppointmentInitial());

  Future<void> bookAppointment({
    required UserModel doctor,
    required DateTime selectedDateTime,
  }) async {
    emit(AppointmentLoading());

    final userResult = await getCurrentUserUseCase();

    userResult.fold((failure) => emit(AppointmentFailure(failure.toString())), (
      user,
    ) async {
      final appointment = AppointmentModel(
        id: const Uuid().v4(),
        doctorId: doctor.uid!,
        userId: user!.uid,
        doctorName: doctor.name!,
        userName: user.name,
        appointmentDate: selectedDateTime,
        status: 'pending',
        createdAt: DateTime.now(),
      );

      final result = await addAppointmentUseCase(appointment);

      result.fold(
        (failure) => emit(AppointmentFailure(failure.toString())),
        (_) => emit(AppointmentSuccess()),
      );
    });
  }
}
