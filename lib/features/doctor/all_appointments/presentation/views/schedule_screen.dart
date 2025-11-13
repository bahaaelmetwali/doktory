import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/cubits/doctor_appointments/doctor_appointments_cubit.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/schedule/schedule_screen_body.dart';
import 'package:doktory/features/doctor/all_appointments/use_cases/get_appointments_for_doctor_use_case.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_current_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorAppointmentsCubit(
        getIt<GetAppointmentsForDoctorUseCase>(),
        getIt<GetCurrentUserUseCase>(),
      )..getAppointments(),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: ScheduleScreenBody(),
      ),
    );
  }
}
