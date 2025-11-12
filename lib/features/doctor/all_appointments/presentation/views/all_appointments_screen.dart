import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/all_appointments_screen_body.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/auth_check/auth_check_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllAppointmentsScreen extends StatelessWidget {
  const AllAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCheckCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: SafeArea(child: AllAppointmentsScreenBody()),
      ),
    );
  }
}
