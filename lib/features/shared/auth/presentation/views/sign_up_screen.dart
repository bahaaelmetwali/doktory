import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/features/shared/auth/domain/usecases/create_user_use_case.dart';
import 'package:doktory/features/shared/auth/domain/usecases/register_use_case.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/sign_up_screen/sign_up_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterCubit(getIt<RegisterUseCase>(), getIt<CreateUserUseCase>()),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: SafeArea(child: SignUpScreenBody()),
      ),
    );
  }
}
