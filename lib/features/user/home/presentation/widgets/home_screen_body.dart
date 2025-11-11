import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/core/widgets/home_app_bar.dart';
import 'package:doktory/features/user/home/presentation/cubits/all_doctors/all_doctors_cubit.dart';
import 'package:doktory/features/user/home/presentation/widgets/categories_section.dart';
import 'package:doktory/features/user/home/presentation/widgets/doctors_list.dart';
import 'package:doktory/features/user/home/presentation/widgets/welcome_banner_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeUserScreenBody extends StatelessWidget {
  const HomeUserScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AllDoctorsCubit>()..getDoctors(),
      child: BlocBuilder<AllDoctorsCubit, AllDoctorsState>(
        builder: (context, state) {
          Widget doctorsSection;

          if (state is AllDoctorsLoading) {
            doctorsSection = const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          } else if (state is AllDoctorsError) {
            doctorsSection = Center(child: Text('حدث خطأ: ${state.message}'));
          } else if (state is AllDoctorsLoaded) {
            doctorsSection = DoctorsList(doctors: state.doctors);
          } else {
            doctorsSection = const SizedBox.shrink();
          }

          return ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              HomeAppBar(),
              SizedBox(height: 20.h),
              WelcomeBannerSection(),
              SizedBox(height: 10.h),
              CategoriesSection(),
              SizedBox(height: 10.h),
              doctorsSection,
            ],
          );
        },
      ),
    );
  }
}
