import 'package:doktory/features/doctor/all_appointments/presentation/cubits/cubit/doctor_appointments_state.dart';
import 'package:doktory/features/doctor/all_appointments/use_cases/get_appointments_for_doctor_use_case.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_current_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorAppointmentsCubit extends Cubit<DoctorAppointmentsState> {
  final GetAppointmentsForDoctorUseCase getAppointmentsForDoctorUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  DoctorAppointmentsCubit(
    this.getAppointmentsForDoctorUseCase,
    this.getCurrentUserUseCase,
  ) : super(DoctorAppointmentsInitial());

  Future<void> getAppointments() async {
    emit(DoctorAppointmentsLoading());

    final doctorResult = await getCurrentUserUseCase();

    await doctorResult.fold(
      (failure) async {
        emit(DoctorAppointmentsFailure(failure.toString()));
      },
      (user) async {
        if (user == null) {
          emit(DoctorAppointmentsFailure('لم يتم العثور على بيانات المستخدم.'));
          return;
        }

        final doctorId = user.uid;
        final result = await getAppointmentsForDoctorUseCase(doctorId);

        result.fold(
          (failure) => emit(DoctorAppointmentsFailure(failure.toString())),
          (appointments) => emit(DoctorAppointmentsSuccess(appointments)),
        );
      },
    );
  }
}
