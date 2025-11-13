import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class UserCardLoadingShimmer extends StatelessWidget {
  const UserCardLoadingShimmer({super.key});

  Widget _buildShimmerLine() {
    return Container(
      height: 14.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8.r),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      color: Colors.grey.shade300,
      child: Container(
        padding: EdgeInsets.all(15.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 45.r,
                backgroundColor: Colors.grey.shade300,
              ),
            ),
            SizedBox(height: 15.h),
            _buildShimmerLine(),
            SizedBox(height: 10.h),
            _buildShimmerLine(),
            SizedBox(height: 10.h),
            _buildShimmerLine(),
            SizedBox(height: 10.h),
            _buildShimmerLine(),
          ],
        ),
      ),
    );
  }
}
