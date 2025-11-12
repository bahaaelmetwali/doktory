import 'package:doktory/features/shared/appointment/data/models/appointment_model.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class DoctorAppointmentsState {}

class DoctorAppointmentsInitial extends DoctorAppointmentsState {}

class DoctorAppointmentsLoading extends DoctorAppointmentsState {}

class DoctorAppointmentsSuccess extends DoctorAppointmentsState {
  final List<AppointmentModel> appointments;
  DoctorAppointmentsSuccess(this.appointments);
}

class DoctorAppointmentsFailure extends DoctorAppointmentsState {
  final String message;
  DoctorAppointmentsFailure(this.message);
}
