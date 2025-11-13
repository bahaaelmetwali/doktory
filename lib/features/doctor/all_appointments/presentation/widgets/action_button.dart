import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final bool isFilled;
  final VoidCallback? onTap;
  final bool isLoading;

  const ActionButton({
    super.key,
    required this.text,
    this.onTap,
    this.isFilled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        width: 140.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: isFilled ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: isFilled
              ? null
              : Border.all(width: 1.w, color: AppColors.primary),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: Styles.textStyle16Medium.copyWith(
                  color: isFilled ? Colors.white : AppColors.primary,
                ),
              ),
              if (isLoading) ...[
                SizedBox(width: 8.w),
                SizedBox(
                  width: 16.w,
                  height: 16.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.w,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isFilled ? Colors.white : AppColors.primary,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
