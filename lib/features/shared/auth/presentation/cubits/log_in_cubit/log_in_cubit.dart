import 'package:doktory/features/shared/auth/data/models/auth_request_model.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_user_data_use_case.dart';
import 'package:doktory/features/shared/auth/domain/usecases/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this._loginUseCase, this._getUserDataUseCase)
    : super(LogInInitial());
  final LoginUseCase _loginUseCase;
  final GetUserDataUseCase _getUserDataUseCase;
  Future<void> loginUser(AuthRequestModel model) async {
    emit(LogInLoading());

    final loginResult = await _loginUseCase(model);

    await loginResult.fold(
      (failure) async {
        emit(LogInFailure(failure.toString()));
      },
      (firebaseUser) async {
        if (firebaseUser == null) {
          emit(LogInFailure('فشل تسجيل الدخول، حاول مرة أخرى'));
          return;
        }

        final userResult = await _getUserDataUseCase.call(
          uid: firebaseUser.uid,
        );

        userResult.fold((failure) => emit(LogInFailure(failure.toString())), (
          userModel,
        ) {
          if (userModel == null) {
            emit(LogInFailure('فشل جلب بيانات المستخدم'));
          } else {
            emit(LogInSuccess(userModel));
          }
        });
      },
    );
  }
}
