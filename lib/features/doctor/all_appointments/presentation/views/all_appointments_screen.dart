import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/cubits/doctor_appointments/doctor_appointments_cubit.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/all_appointments/all_appointments_screen_body.dart';
import 'package:doktory/features/doctor/all_appointments/use_cases/get_appointments_for_doctor_use_case.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_current_user.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/auth_check/auth_check_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllAppointmentsScreen extends StatelessWidget {
  const AllAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthCheckCubit>()),
        BlocProvider(
          create: (context) => DoctorAppointmentsCubit(
            getIt<GetAppointmentsForDoctorUseCase>(),
            getIt<GetCurrentUserUseCase>(),
          )..getAppointments(),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: const SafeArea(child: AllAppointmentsScreenBody()),
      ),
    );
  }
}
