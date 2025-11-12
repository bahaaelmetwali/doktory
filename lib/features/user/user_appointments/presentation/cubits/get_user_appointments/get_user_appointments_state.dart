part of 'get_user_appointments_cubit.dart';

@immutable
abstract class GetUserAppointmentsState {}

class GetUserAppointmentsInitial extends GetUserAppointmentsState {}

class GetUserAppointmentsLoading extends GetUserAppointmentsState {}

class GetUserAppointmentsLoaded extends GetUserAppointmentsState {
  final UserModel user;
  final List<AppointmentModel> appointments;

  GetUserAppointmentsLoaded({required this.user, required this.appointments});
}

class GetUserAppointmentsError extends GetUserAppointmentsState {
  final String message;

  GetUserAppointmentsError(this.message);
}
