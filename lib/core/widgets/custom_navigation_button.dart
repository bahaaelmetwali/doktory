import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigationButton extends StatelessWidget {
  const CustomNavigationButton({
    super.key,
    required this.solidText,
    required this.navigationText,
    required this.onPressed,
  });
  final String solidText;
  final String navigationText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(solidText, style: Styles.textStyle16Medium),
        TextButton(
          onPressed: onPressed,
          child: Column(
            children: [
              Text(
                navigationText,
                style: Styles.textStyle16Medium.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 2.h),
              Container(height: 2.h, width: 100.w, color: AppColors.primary),
            ],
          ),
        ),
      ],
    );
  }
}
