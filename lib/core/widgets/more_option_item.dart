import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreOptionItem extends StatelessWidget {
  const MoreOptionItem({
    super.key,
    required this.iconPath,
    required this.label,
    this.onTap,
    this.trallingWidget,
    this.labelStyle,
    this.iconBackgroundColor,
    this.iconColor,
  });
  final Color? iconBackgroundColor;
  final TextStyle? labelStyle;
  final String iconPath;
  final String label;
  final VoidCallback? onTap;
  final Widget? trallingWidget;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundColor: iconBackgroundColor ?? const Color(0xffE9E9E9),
              child: SvgPicture.asset(
                iconPath,
                color: iconColor ?? AppColors.primary,
                height: 22.r,
                width: 22.r,
              ),
            ),
            SizedBox(width: 8.w),
            Text(label, style: labelStyle ?? Styles.textStyle16Medium),
            Spacer(),
            trallingWidget ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
