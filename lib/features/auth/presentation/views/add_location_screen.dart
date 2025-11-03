import 'package:doktory/core/constants.dart';
import 'package:doktory/features/auth/presentation/widgets/add_location_screen/add_location_screen_body.dart';
import 'package:flutter/material.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: AddLocationScreenBody(),
    );
  }
}
