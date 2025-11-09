part of 'all_doctors_cubit.dart';

abstract class AllDoctorsState {}

class AllDoctorsInitial extends AllDoctorsState {}

class AllDoctorsLoading extends AllDoctorsState {}

class AllDoctorsLoaded extends AllDoctorsState {
  final List<UserModel> doctors;
  AllDoctorsLoaded(this.doctors);
}

class AllDoctorsError extends AllDoctorsState {
  final String message;
  AllDoctorsError(this.message);
}
