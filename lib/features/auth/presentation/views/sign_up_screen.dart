import 'package:doktory/core/constants.dart';
import 'package:doktory/features/auth/presentation/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(child: SignUpScreenBody()),
    );
  }
}
