part of 'full_user_data_cubit.dart';

@immutable
sealed class FullUserDataState {}

final class FullUserDataInitial extends FullUserDataState {}

final class FullUserDataLoading extends FullUserDataState {}

final class FullUserDataLoaded extends FullUserDataState {
  final UserModel? user;
  FullUserDataLoaded(this.user);
}

final class FullUserDataError extends FullUserDataState {
  final Failure failure;
  FullUserDataError(this.failure);
}
