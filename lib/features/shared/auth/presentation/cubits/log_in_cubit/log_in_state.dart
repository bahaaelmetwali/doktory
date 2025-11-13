part of 'log_in_cubit.dart';

@immutable
sealed class LogInState {
  const LogInState();
}

class LogInInitial extends LogInState {
  const LogInInitial();
}

class LogInLoading extends LogInState {
  const LogInLoading();
}

class LogInSuccess extends LogInState {
  final UserModel user;

  const LogInSuccess(this.user);
}

class LogInFailure extends LogInState {
  final String message;

  const LogInFailure(this.message);
}
