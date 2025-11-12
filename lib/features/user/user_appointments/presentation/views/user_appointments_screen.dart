import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/features/shared/appointment/domain/use_cases/get_appointments_for_user_use_case.dart';
import 'package:doktory/features/user/doctor_details/domain/usecases/get_full_user_data_use_case.dart';
import 'package:doktory/features/user/user_appointments/presentation/cubits/get_user_appointments/get_user_appointments_cubit.dart';
import 'package:doktory/features/user/user_appointments/presentation/widgets/user_appointments_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAppointmentsScreen extends StatelessWidget {
  const UserAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserAppointmentsCubit(
        getAppointmentsForUserUseCase: getIt<GetAppointmentsForUserUseCase>(),
        getFullUserDataUseCase: getIt<GetFullUserDataUseCase>(),
      )..fetchUserAndAppointments(),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: UserAppointmentsScreenBody(),
      ),
    );
  }
}
