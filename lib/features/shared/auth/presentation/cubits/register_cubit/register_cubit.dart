import 'package:bloc/bloc.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/shared/auth/data/models/auth_request_model.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/domain/usecases/create_user_use_case.dart';
import 'package:doktory/features/shared/auth/domain/usecases/register_use_case.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase, this.createUserUseCase)
    : super(RegisterInitial());

  final RegisterUseCase registerUseCase;
  final CreateUserUseCase createUserUseCase;

  Future<void> registerUser(AuthRequestModel model) async {
    emit(RegisterLoading());

    final result = await registerUseCase(model);

    await result.fold(
      (Failure failure) async {
        emit(RegisterFailure(failure.toString()));
      },
      (UserModel? user) async {
        if (user == null) {
          emit(RegisterFailure('فشل التسجيل، حاول مرة أخرى.'));
          return;
        }

        final firestoreResult = await createUserUseCase(user);

        firestoreResult.fold(
          (failure) => emit(RegisterFailure(failure.toString())),
          (_) => emit(RegisterSuccess(user)),
        );
      },
    );
  }
}
