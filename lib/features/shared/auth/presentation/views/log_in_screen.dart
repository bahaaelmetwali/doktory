import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_user_data_use_case.dart';
import 'package:doktory/features/shared/auth/domain/usecases/login_use_case.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/log_in_cubit/log_in_cubit.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/log_in_screen/log_in_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LogInCubit(getIt<LoginUseCase>(), getIt<GetUserDataUseCase>()),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: SafeArea(child: LogInScreenBody()),
      ),
    );
  }
}
