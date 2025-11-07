import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/home_app_bar.dart';
import 'package:doktory/features/user/doctor_list_screen/presentation/widgets/categories_section.dart';
import 'package:doktory/features/user/doctor_list_screen/presentation/widgets/welcome_banner_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsListScreenBody extends StatelessWidget {
  const DoctorsListScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBar(),
        SizedBox(height: 20.h),
        WelcomeBannerSection(),
        SizedBox(height: 10.h),
        CategoriesSection(),
      ],
    );
  }
}
