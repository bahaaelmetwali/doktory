import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/features/shared/more/presentation/cubits/full_user_data/full_user_data_cubit.dart';
import 'package:doktory/features/shared/more/presentation/widgets/show_user_profile_screen_body.dart';
import 'package:doktory/features/user/doctor_details/domain/usecases/get_full_user_data_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowUserProfileScreen extends StatelessWidget {
  const ShowUserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FullUserDataCubit(getIt<GetFullUserDataUseCase>())
            ..fetchFullUserData(),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: Scaffold(
          backgroundColor: AppColors.scaffold,
          body: BlocBuilder<FullUserDataCubit, FullUserDataState>(
            builder: (context, state) {
              if (state is FullUserDataLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FullUserDataLoaded) {
                return ShowUserProfileScreenBody(user: state.user!);
              } else if (state is FullUserDataError) {
                return Center(
                  child: Text(
                    'Error: ${state.failure.errorMessage}',
                    style: Styles.textStyle16Medium,
                  ),
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
