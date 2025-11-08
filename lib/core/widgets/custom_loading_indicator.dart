import 'package:doktory/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 345.w,

      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: SizedBox(
          height: 30.r,
          width: 30.r,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 3.r,
          ),
        ),
      ),
    );
  }
}
