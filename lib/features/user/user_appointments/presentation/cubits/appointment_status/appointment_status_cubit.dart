import 'package:bloc/bloc.dart';
import 'package:doktory/features/doctor/all_appointments/use_cases/update_appointment_status_use_case.dart';
import 'package:flutter/foundation.dart';

part 'appointment_status_state.dart';

class AppointmentStatusCubit extends Cubit<AppointmentStatusState> {
  final UpdateAppointmentStatusUseCase _updateStatusUseCase;

  AppointmentStatusCubit(this._updateStatusUseCase)
    : super(AppointmentStatusInitial());

  Future<void> updateStatus(
    String appointmentId,
    String newStatus, {
    String? rejectionReason,
  }) async {
    emit(AppointmentStatusLoading());

    final result = await _updateStatusUseCase(
      appointmentId,
      newStatus,
      rejectionReason: rejectionReason,
    );

    result.fold(
      (failure) => emit(AppointmentStatusFailure(failure.toString())),
      (_) => emit(AppointmentStatusSuccess(newStatus)),
    );
  }
}
