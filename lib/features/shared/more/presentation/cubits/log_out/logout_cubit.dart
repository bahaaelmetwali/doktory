import 'package:doktory/features/shared/more/domain/use_cases/log_out_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase logoutUseCase;

  LogoutCubit({required this.logoutUseCase}) : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());
    final result = await logoutUseCase();
    result.fold(
      (failure) => emit(LogoutFailure(failure.toString())),
      (_) => emit(LogoutSuccess()),
    );
  }
}
