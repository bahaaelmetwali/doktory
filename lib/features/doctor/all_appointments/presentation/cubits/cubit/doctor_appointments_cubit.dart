import 'package:doktory/features/doctor/all_appointments/presentation/cubits/cubit/doctor_appointments_state.dart';
import 'package:doktory/features/doctor/all_appointments/use_cases/get_appointments_for_doctor_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorAppointmentsCubit extends Cubit<DoctorAppointmentsState> {
  final GetAppointmentsForDoctorUseCase getAppointmentsForDoctorUseCase;

  DoctorAppointmentsCubit(this.getAppointmentsForDoctorUseCase)
    : super(DoctorAppointmentsInitial());

  Future<void> getAppointments(String doctorId) async {
    emit(DoctorAppointmentsLoading());
    final result = await getAppointmentsForDoctorUseCase(doctorId);

    result.fold(
      (failure) => emit(DoctorAppointmentsFailure(failure.toString())),
      (appointments) => emit(DoctorAppointmentsSuccess(appointments)),
    );
  }
}
