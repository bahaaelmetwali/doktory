import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RoleCard extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.iconPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Container(
          width: 150.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.grey.shade300, width: 2.w),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 60.r,
                  backgroundColor: AppColors.bright,
                  child: SvgPicture.asset(iconPath, width: 80.w, height: 80.h),
                ),
                SizedBox(height: 10.h),
                Text(label, style: Styles.textStyle18SemiBold),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
