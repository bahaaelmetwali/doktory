import 'package:doktory/core/constants.dart';
import 'package:doktory/features/user/doctor_list_screen/presentation/widgets/doctors_list_screen_body.dart';
import 'package:flutter/material.dart';

class DoctorsListScreen extends StatelessWidget {
  const DoctorsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(child: DoctorsListScreenBody()),
    );
  }
}
