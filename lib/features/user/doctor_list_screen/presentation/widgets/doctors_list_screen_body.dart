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
    return ListView(
      children: [
        HomeAppBar(),
        SizedBox(height: 20.h),
        WelcomeBannerSection(),
        SizedBox(height: 10.h),
        CategoriesSection(),

        Padding(
          padding: EdgeInsets.all(8.r),
          child: Column(
            children: [
              Row(
                children: [
                  Text('كل الأطباء', style: Styles.textStyle18SemiBold),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'عرض الكل',
                      style: Styles.textStyle14SemiBold.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.asset(
                              'assets/logos/doctor_test.jpg',
                              height: 70.h,
                              width: 80.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 12.w),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'د. محمد علي',
                                  style: Styles.textStyle16Medium,
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  'عيادة القاهرة -الزمالك',
                                  style: Styles.textStyle14Regular.copyWith(
                                    color: Colors.grey[700],
                                  ),
                                ),
                                SizedBox(height: 10.h),

                                GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 18,
                                        color: AppColors.primary,
                                      ),
                                      SizedBox(width: 2.w),
                                      Text(
                                        'احجز',
                                        style: Styles.textStyle12SemiBold
                                            .copyWith(color: AppColors.primary),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
