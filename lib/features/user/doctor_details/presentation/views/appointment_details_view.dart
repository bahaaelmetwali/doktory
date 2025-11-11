import 'package:doktory/core/constants.dart';
import 'package:doktory/features/user/doctor_details/data/models/appointment_model.dart';
import 'package:flutter/material.dart';

class AppointmentDetailsView extends StatelessWidget {
  const AppointmentDetailsView({super.key, required this.appointment});
  final AppointmentModel appointment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.scaffold);
  }
}
