import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/appointment/domain/use_cases/add_appointment_use_case.dart';
import 'package:doktory/features/user/doctor_details/domain/usecases/get_full_user_data_use_case.dart';
import 'package:doktory/features/user/doctor_details/presentation/cubits/appointment/appointment_cubit.dart';
import 'package:doktory/features/user/doctor_details/presentation/widgets/doctor_details_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.doctor});
  final UserModel doctor;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentCubit(
        addAppointmentUseCase: getIt<AddAppointmentUseCase>(),
        getFullUserDataUseCase: getIt<GetFullUserDataUseCase>(),
      ),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: DoctorDetailsScreenBody(doctor: doctor),
      ),
    );
  }
}
