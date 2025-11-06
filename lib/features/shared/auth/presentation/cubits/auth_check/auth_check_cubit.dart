import 'package:bloc/bloc.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_current_user.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_user_data_use_case.dart';

part 'auth_check_state.dart';

class AuthCheckCubit extends Cubit<AuthCheckState> {
  final GetCurrentUserUseCase getCurrentUser;
  final GetUserDataUseCase getUserDataUseCase;

  AuthCheckCubit({
    required this.getCurrentUser,
    required this.getUserDataUseCase,
  }) : super(AuthCheckInitial());

  Future<void> checkAuth() async {
    emit(AuthCheckLoading());

    final firebaseUser = await getCurrentUser();
    if (firebaseUser == null) {
      emit(AuthCheckUnauthenticated());
      return;
    }

    final result = await getUserDataUseCase(uid: firebaseUser.uid);

    result.fold(
      (failure) {
        emit(AuthCheckFailure(failure.toString()));
      },
      (userData) {
        if (userData == null ||
            userData.role == null ||
            userData.name == null ||
            userData.phone == null ||
            userData.governorate == null) {
          emit(AuthCheckNeedsCompletion(userData));
        } else {
          emit(AuthCheckAuthenticated(userData));
        }
      },
    );
  }
}
