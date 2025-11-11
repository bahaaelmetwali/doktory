import 'package:bloc/bloc.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/user/doctor_details/data/models/appointment_model.dart';
import 'package:doktory/features/user/doctor_details/domain/usecases/get_appointments_for_user_use_case.dart';
import 'package:doktory/features/user/doctor_details/domain/usecases/get_full_user_data_use_case.dart';
import 'package:meta/meta.dart';

part 'get_user_appointments_state.dart';

class GetUserAppointmentsCubit extends Cubit<GetUserAppointmentsState> {
  final GetFullUserDataUseCase getFullUserDataUseCase;
  final GetAppointmentsForUserUseCase getAppointmentsForUserUseCase;

  GetUserAppointmentsCubit({
    required this.getFullUserDataUseCase,
    required this.getAppointmentsForUserUseCase,
  }) : super(GetUserAppointmentsInitial());

  Future<void> fetchUserAndAppointments() async {
    emit(GetUserAppointmentsLoading());

    final userResult = await getFullUserDataUseCase();
    userResult.fold(
      (failure) => emit(GetUserAppointmentsError(failure.toString())),
      (user) async {
        if (user == null) {
          emit(GetUserAppointmentsError("لا يوجد بيانات مستخدم"));
          return;
        }

        final appointmentsResult = await getAppointmentsForUserUseCase(
          user.uid,
        );
        appointmentsResult.fold(
          (failure) => emit(GetUserAppointmentsError(failure.toString())),
          (appointments) => emit(
            GetUserAppointmentsLoaded(user: user, appointments: appointments),
          ),
        );
      },
    );
  }
}
