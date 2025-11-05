import 'package:bloc/bloc.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_current_user.dart';

part 'auth_check_state.dart';

class AuthCheckCubit extends Cubit<AuthCheckState> {
  final GetCurrentUserUseCase _getCurrentUser;

  AuthCheckCubit(this._getCurrentUser) : super(AuthCheckInitial());

  Future<void> checkAuth() async {
    emit(AuthCheckLoading());
    final user = await _getCurrentUser();
    if (user == null) {
      emit(AuthCheckUnauthenticated());
    } else {
      if (user.name == null ||
          user.phone == null ||
          user.governorate == null ||
          user.role == null) {
        emit(AuthCheckNeedsCompletion(user));
      } else {
        emit(AuthCheckAuthenticated(user));
      }
    }
  }
}
