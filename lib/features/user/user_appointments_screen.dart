import 'package:doktory/core/constants.dart';
import 'package:doktory/features/user/doctor_details/presentation/widgets/user_appointments_screen_body.dart';
import 'package:flutter/material.dart';

class UserAppointmentsScreen extends StatelessWidget {
  const UserAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: UserAppointmentsScreenBody(),
    );
  }
}
