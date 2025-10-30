import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.name,
    required this.hintText,

    this.iconPath,
    this.validator,
    this.controller,
    this.nameTextStyle,
    this.suffixIcon,
    this.isDescription = false,
    this.textInputType = TextInputType.text,
    this.readOnly = false,
    this.height,
    this.obscureText = false,
  });
  final String name;
  final TextStyle? nameTextStyle;
  final Widget? suffixIcon;
  final String hintText;
  final String? iconPath;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool isDescription;
  final TextInputType textInputType;
  final bool readOnly;
  final double? height;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: nameTextStyle == null
                ? Styles.textStyle16Medium
                : nameTextStyle!,
          ),
          SizedBox(height: 4.h),
          SizedBox(
            width: 335.w,
            child: TextFormField(
              obscureText: obscureText,
              readOnly: readOnly,
              minLines: isDescription ? 3 : 1,
              maxLines: isDescription ? null : 1,
              validator: validator,
              controller: controller,
              style: Styles.textStyle16Medium.copyWith(
                color: readOnly ? Colors.grey : Colors.black,
              ),

              keyboardType: textInputType,
              decoration: InputDecoration(
                isDense: false,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 12.h,
                ),
                prefixIcon: iconPath != null
                    ? Padding(
                        padding: EdgeInsets.all(8.sp),
                        child: SvgPicture.asset(
                          iconPath!,
                          width: 20.w,
                          height: 20.h,
                        ),
                      )
                    : null,
                prefixIconConstraints: BoxConstraints(
                  minWidth: 20.w,
                  minHeight: 20.h,
                ),
                suffixIcon: suffixIcon != null
                    ? Padding(padding: EdgeInsets.all(8.sp), child: suffixIcon)
                    : null,
                filled: true,
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: Styles.textStyle16Medium.copyWith(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: readOnly ? Colors.grey.shade300 : AppColors.primary,
                    width: 1.5,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
