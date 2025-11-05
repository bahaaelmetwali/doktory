import 'package:bloc/bloc.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/auth/data/models/user_model.dart';
import 'package:doktory/features/auth/domain/usecases/complete_user_data_use_case.dart';
import 'package:meta/meta.dart';

part 'complete_user_data_state.dart';

class CompleteUserDataCubit extends Cubit<CompleteUserDataState> {
  final CompleteUserDataUseCase _completeUserDataUseCase;

  CompleteUserDataCubit(this._completeUserDataUseCase)
    : super(CompleteUserDataInitial());

  Future<void> completeUserData({required UserModel user}) async {
    emit(CompleteUserDataLoading());

    final result = await _completeUserDataUseCase(user: user);

    result.fold(
      (Failure failure) => emit(CompleteUserDataFailure(failure.toString())),
      (_) => emit(CompleteUserDataSuccess()),
    );
  }
}
