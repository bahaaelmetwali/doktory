import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/features/user/home/presentation/cubits/all_doctors/all_doctors_cubit.dart';
import 'package:doktory/features/user/home/presentation/widgets/all_doctors_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllDoctorsScreen extends StatelessWidget {
  const AllDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AllDoctorsCubit>()..getDoctors(),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,

        body: AllDoctorsScreenBody(),
      ),
    );
  }
}
