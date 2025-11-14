import 'package:doktory/core/constants.dart';
import 'package:doktory/features/shared/user_profile_screen/presentation/widgets/user_profile_screen_body.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: UserProfileScreenBody(),
    );
  }
}
