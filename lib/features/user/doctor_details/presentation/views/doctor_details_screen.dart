import 'package:doktory/core/constants.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/user/doctor_details/presentation/widgets/doctor_details_screen_body.dart';
import 'package:flutter/material.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.doctor});
  final UserModel doctor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightText,
      body: DoctorDetailsScreenBody(doctor: doctor),
    );
  }
}
