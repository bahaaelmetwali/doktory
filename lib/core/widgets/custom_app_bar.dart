import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.onTap,
    required this.headingText,
    this.isBack = true,
  });
  final void Function()? onTap;
  final String headingText;
  final bool isBack;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).padding.top,
          color: Colors.white,
        ),
        Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(top: 24.h, right: 8.w, left: 8.w),
            child: Row(
              children: [
                isBack
                    ? GestureDetector(
                        onTap: onTap,
                        child: SvgPicture.asset(
                          'assets/icons/arrow-right.svg',
                          height: 20.h,
                          width: 30.w,
                        ),
                      )
                    : SizedBox(width: 30.w, height: 20.h),
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
