part of 'complete_user_data_cubit.dart';

@immutable
sealed class CompleteUserDataState {}

class CompleteUserDataInitial extends CompleteUserDataState {}

class CompleteUserDataLoading extends CompleteUserDataState {}

class CompleteUserDataSuccess extends CompleteUserDataState {}

class CompleteUserDataFailure extends CompleteUserDataState {
  final String message;
  CompleteUserDataFailure(this.message);
}
