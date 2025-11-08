import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/auth_check/auth_check_cubit.dart';
import 'package:doktory/features/user/doctor_list_screen/presentation/widgets/doctors_list_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsListScreen extends StatelessWidget {
  const DoctorsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCheckCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: SafeArea(child: DoctorsListScreenBody()),
      ),
    );
  }
}
