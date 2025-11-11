import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DoctorDetailsState {
  const DoctorDetailsState();
}

class DoctorDetailsInitial extends DoctorDetailsState {}

class DoctorDetailsLoading extends DoctorDetailsState {}

class DoctorDetailsLoaded extends DoctorDetailsState {
  final UserModel doctor;

  const DoctorDetailsLoaded(this.doctor);
}

class DoctorDetailsError extends DoctorDetailsState {
  final String message;

  const DoctorDetailsError(this.message);
}
