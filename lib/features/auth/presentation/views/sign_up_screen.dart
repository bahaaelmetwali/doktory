import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/features/auth/presentation/cubits/cubit/register_cubit.dart';
import 'package:doktory/features/auth/presentation/widgets/sign_up_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterCubit>(),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: SafeArea(child: SignUpScreenBody()),
      ),
    );
  }
}
