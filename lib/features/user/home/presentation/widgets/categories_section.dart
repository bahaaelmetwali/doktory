import 'package:doktory/core/constants.dart';
import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('التخصصات', style: Styles.textStyle18SemiBold),
          SizedBox(height: 10.h),
          SizedBox(
            height: 40.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Constants.doctorSpecializations.length,
              itemBuilder: (context, index) {
                final specialization = Constants.doctorSpecializations[index];

                return Padding(
                  padding: EdgeInsets.only(left: 8.r),
                  child: GestureDetector(
                    onTap: () {
                      context.push(
                        AppRouterNames.categoryDoctors,
                        extra: specialization,
                      );
                    },
                    child: Container(
                      height: 40.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          Constants.doctorSpecializations[index],
                          style: Styles.textStyle12SemiBold.copyWith(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
