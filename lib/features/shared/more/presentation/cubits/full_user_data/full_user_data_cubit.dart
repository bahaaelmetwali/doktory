import 'package:doktory/features/user/doctor_details/domain/usecases/get_full_user_data_use_case.dart';
import 'package:doktory/core/errors/failure.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'full_user_data_state.dart';

class FullUserDataCubit extends Cubit<FullUserDataState> {
  final GetFullUserDataUseCase getFullUserDataUseCase;

  FullUserDataCubit(this.getFullUserDataUseCase) : super(FullUserDataInitial());

  Future<void> fetchFullUserData() async {
    emit(FullUserDataLoading());
    final result = await getFullUserDataUseCase.call();
    result.fold(
      (failure) => emit(FullUserDataError(failure)),
      (user) => emit(FullUserDataLoaded(user)),
    );
  }
}
