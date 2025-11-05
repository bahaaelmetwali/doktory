import 'package:doktory/features/shared/auth/data/models/auth_request_model.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/domain/usecases/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this._loginUseCase) : super(LogInInitial());
  final LoginUseCase _loginUseCase;
  Future<void> loginUser(AuthRequestModel model) async {
    emit(LogInLoading());
    final result = await _loginUseCase(model);
    result.fold(
      (failure) {
        emit(LogInFailure(failure.toString()));
      },
      (user) {
        if (user != null) {
          emit(LogInSuccess(user));
        } else {
          emit(LogInFailure('فشل التسجيل، حاول مرة أخرى.'));
        }
      },
    );
  }
}
