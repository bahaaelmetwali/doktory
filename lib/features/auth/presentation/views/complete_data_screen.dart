import 'package:doktory/core/constants.dart';
import 'package:doktory/features/auth/presentation/widgets/complete_data_screen_body.dart';
import 'package:flutter/material.dart';

class CompleteDataScreen extends StatelessWidget {
  const CompleteDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(child: CompleteDataScreenBody()),
    );
  }
}
