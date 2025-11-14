import 'package:doktory/core/constants.dart';
import 'package:doktory/features/shared/user_profile_screen/presentation/widgets/More_screen_body.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: MoreScreenBody(),
    );
  }
}
