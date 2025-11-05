import 'package:doktory/core/constants.dart';
import 'package:doktory/core/location/cubit/location_cubit_cubit.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/add_location_screen/add_location_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddLocationScreen extends StatelessWidget {
  const AddLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LocationCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: SafeArea(child: AddLocationScreenBody()),
      ),
    );
  }
}
