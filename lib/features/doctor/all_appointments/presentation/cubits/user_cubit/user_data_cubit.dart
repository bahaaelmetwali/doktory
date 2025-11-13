import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_user_data_use_case.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final GetUserDataUseCase getUserDataUseCase;

  UserDataCubit(this.getUserDataUseCase) : super(UserDataInitial());

  Future<void> getUserData(String uid) async {
    emit(UserDataLoading());
    final result = await getUserDataUseCase(uid: uid);
    result.fold((failure) => emit(UserDataFailure(failure.toString())), (user) {
      if (user != null) {
        emit(UserDataSuccess(user));
      } else {
        emit(UserDataFailure('لم يتم العثور على بيانات المستخدم.'));
      }
    });
  }
}
