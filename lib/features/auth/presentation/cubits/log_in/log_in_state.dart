part of 'log_in_cubit.dart';

sealed class LogInState {}

class LogInInitial extends LogInState {}

class LogInLoading extends LogInState {}

class LogInSuccess extends LogInState {
  final UserModel user;

  LogInSuccess(this.user);
}

class LogInFailure extends LogInState {
  final String message;

  LogInFailure(this.message);
}
