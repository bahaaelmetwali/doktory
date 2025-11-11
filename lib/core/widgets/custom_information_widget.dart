import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomInformationWidget extends StatelessWidget {
  const CustomInformationWidget({
    super.key,
    required this.content,
    required this.iconPath,
    required this.title,
    this.onMorePressed,
  });

  final List<Widget> content;
  final String iconPath;
  final String title;
  final VoidCallback? onMorePressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        iconPath,
                        width: 20.w,
                        height: 20.h,
                        color: AppColors.primary,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        title,
                        style: Styles.textStyle14Regular.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),

                  Spacer(),
                  if (onMorePressed != null)
                    GestureDetector(
                      onTap: onMorePressed,
                      child: Text(
                        'المزيد',
                        style: Styles.textStyle14Regular.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                ],
              ),
              Divider(color: Colors.grey.shade300, thickness: 1.25.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
