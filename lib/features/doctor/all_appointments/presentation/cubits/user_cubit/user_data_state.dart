part of 'user_data_cubit.dart';

@immutable
abstract class UserDataState {
  const UserDataState();
}

class UserDataInitial extends UserDataState {
  const UserDataInitial();
}

class UserDataLoading extends UserDataState {
  const UserDataLoading();
}

class UserDataSuccess extends UserDataState {
  final UserModel user;
  const UserDataSuccess(this.user);
}

class UserDataFailure extends UserDataState {
  final String message;
  const UserDataFailure(this.message);
}
