part of 'auth_check_cubit.dart';

abstract class AuthCheckState {}

class AuthCheckInitial extends AuthCheckState {}

class AuthCheckLoading extends AuthCheckState {}

class AuthCheckAuthenticated extends AuthCheckState {
  final UserModel user;
  AuthCheckAuthenticated(this.user);
}

class AuthCheckUnauthenticated extends AuthCheckState {}

class AuthCheckNeedsCompletion extends AuthCheckState {
  final UserModel user;
  AuthCheckNeedsCompletion(this.user);
}
