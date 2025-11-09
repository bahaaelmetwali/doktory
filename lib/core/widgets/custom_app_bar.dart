import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.onTap,
    required this.headingText,
  });
  final void Function()? onTap;
  final String headingText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(top: 24.h, right: 8.w, left: 8.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: SvgPicture.asset(
                    'assets/icons/arrow-right.svg',
                    height: 20.h,
                    width: 30.w,
                  ),
                ),
                Spacer(),
                Text(headingText, style: Styles.textStyle20SemiBold),
                Spacer(),
                SizedBox(width: 30.w, height: 20.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
