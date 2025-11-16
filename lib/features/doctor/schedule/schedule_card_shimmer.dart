import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ScheduleCardShimmer extends StatelessWidget {
  const ScheduleCardShimmer({super.key});

  Widget _rowShimmer() {
    return Shimmer(
      child: Container(
        height: 15.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Shimmer(
            child: Container(
              width: 90.r,
              height: 90.r,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),

          SizedBox(height: 20.h),

          _rowShimmer(),
          SizedBox(height: 15.h),

          _rowShimmer(),
          SizedBox(height: 15.h),

          _rowShimmer(),
          SizedBox(height: 15.h),

          _rowShimmer(),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
