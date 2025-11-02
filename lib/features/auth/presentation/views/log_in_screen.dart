import 'package:doktory/core/constants.dart';
import 'package:doktory/features/auth/presentation/widgets/log_in_screen_body.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(child: LogInScreenBody()),
    );
  }
}
