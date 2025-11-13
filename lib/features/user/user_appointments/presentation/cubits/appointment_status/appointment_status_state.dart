part of 'appointment_status_cubit.dart';

@immutable
abstract class AppointmentStatusState {
  const AppointmentStatusState();
}

class AppointmentStatusInitial extends AppointmentStatusState {
  const AppointmentStatusInitial();
}

class AppointmentStatusLoading extends AppointmentStatusState {
  const AppointmentStatusLoading();
}

class AppointmentStatusSuccess extends AppointmentStatusState {
  final String newStatus;

  const AppointmentStatusSuccess(this.newStatus);
}

class AppointmentStatusFailure extends AppointmentStatusState {
  final String message;

  const AppointmentStatusFailure(this.message);
}
