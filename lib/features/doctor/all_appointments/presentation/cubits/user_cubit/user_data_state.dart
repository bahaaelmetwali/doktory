part of 'user_data_cubit.dart';

abstract class UserDataState {}

class UserDataInitial extends UserDataState {}

class UserDataLoading extends UserDataState {}

class UserDataSuccess extends UserDataState {
  final UserModel user;
  UserDataSuccess(this.user);
}

class UserDataFailure extends UserDataState {
  final String message;
  UserDataFailure(this.message);
}
