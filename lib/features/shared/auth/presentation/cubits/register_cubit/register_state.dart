part of 'register_cubit.dart';

sealed class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final UserModel user;

  RegisterSuccess(this.user);
}

class RegisterFailure extends RegisterState {
  final String message;

  RegisterFailure(this.message);
}
