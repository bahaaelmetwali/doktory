import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/features/user/doctor_details/presentation/cubits/get_user_appointments_/get_user_appointments_cubit.dart';
import 'package:doktory/features/user/doctor_details/presentation/widgets/user_appointments_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAppointmentsScreen extends StatelessWidget {
  const UserAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<GetUserAppointmentsCubit>()..fetchUserAndAppointments(),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: UserAppointmentsScreenBody(),
      ),
    );
  }
}
