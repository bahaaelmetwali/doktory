import 'package:doktory/core/constants.dart';
import 'package:doktory/features/splash/widgets/selected_role_screen_body.dart';
import 'package:flutter/material.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SelectedRoleScreenBody(),
    );
  }
}
