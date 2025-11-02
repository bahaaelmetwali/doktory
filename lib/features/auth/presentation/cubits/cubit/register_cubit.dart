import 'package:bloc/bloc.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/auth/data/models/auth_request_model.dart';
import 'package:doktory/features/auth/data/models/user_model.dart';
import 'package:doktory/features/auth/domain/usecases/register_use_case.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());
  final RegisterUseCase registerUseCase;

  Future<void> registerUser(AuthRequestModel model) async {
    emit(RegisterLoading());
    final result = await registerUseCase(model);

    result.fold(
      (Failure failure) => emit(RegisterFailure(failure.toString())),
      (UserModel? user) {
        if (user != null) {
          emit(RegisterSuccess(user));
        } else {
          emit(RegisterFailure('فشل التسجيل، حاول مرة أخرى.'));
        }
      },
    );
  }
}
