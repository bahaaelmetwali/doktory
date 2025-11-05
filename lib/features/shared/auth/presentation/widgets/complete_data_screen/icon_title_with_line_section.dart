import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class IconTitleWithLineSection extends StatelessWidget {
  const IconTitleWithLineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/location.svg',
              height: 22.h,
              width: 22.w,
              colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            ),
            SizedBox(width: 2.w),
            Text(
              'عنوان العيادة',
              style: Styles.textStyle18SemiBold.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 130.w,
          child: Divider(thickness: 1.h, color: AppColors.primary),
        ),
      ],
    );
  }
}
