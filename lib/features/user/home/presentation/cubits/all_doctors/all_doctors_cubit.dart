import 'package:bloc/bloc.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/user/home/domain/usecases/get_doctors_use_case.dart';

part 'all_doctors_state.dart';

class AllDoctorsCubit extends Cubit<AllDoctorsState> {
  final GetDoctorsUseCase getDoctorsUseCase;

  AllDoctorsCubit({required this.getDoctorsUseCase})
    : super(AllDoctorsInitial());

  Future<void> getDoctors() async {
    emit(AllDoctorsLoading());
    final result = await getDoctorsUseCase();

    result.fold(
      (failure) => emit(AllDoctorsError(failure.toString())),
      (doctors) => emit(AllDoctorsLoaded(doctors)),
    );
  }
}
