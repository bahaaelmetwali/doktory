import 'package:bloc/bloc.dart';
import 'package:doktory/features/user/doctor_details/domain/usecases/get_doctor_use_case.dart';
import 'package:doktory/features/user/user_appointments/presentation/cubits/doctor_details/doctor_details_state.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  final GetDoctorDataUseCase getDoctorDataUseCase;

  DoctorDetailsCubit(this.getDoctorDataUseCase) : super(DoctorDetailsInitial());

  Future<void> fetchDoctor(String doctorId) async {
    emit(DoctorDetailsLoading());
    final result = await getDoctorDataUseCase(doctorId);
    result.fold((failure) => emit(DoctorDetailsError(failure.toString())), (
      doctor,
    ) {
      if (doctor == null) {
        emit(DoctorDetailsError("الدكتور غير متوفر"));
      } else {
        emit(DoctorDetailsLoaded(doctor));
      }
    });
  }
}
