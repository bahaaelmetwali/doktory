import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class UserCardLoadingShimmer extends StatelessWidget {
  const UserCardLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      color: Colors.grey.shade300,
      duration: const Duration(seconds: 2),
      interval: const Duration(seconds: 0),
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(radius: 40.r, backgroundColor: Colors.grey.shade300),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 12.h, color: Colors.grey.shade300),
                  SizedBox(height: 5.h),
                  Container(height: 12.h, color: Colors.grey.shade300),
                  SizedBox(height: 5.h),
                  Container(height: 12.h, color: Colors.grey.shade300),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
