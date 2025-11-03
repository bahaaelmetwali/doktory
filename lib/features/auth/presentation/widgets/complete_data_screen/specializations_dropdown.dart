import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecializationsDropdown extends StatelessWidget {
  final String? selectedSpecialization;
  final ValueChanged<String?> onChanged;

  const SpecializationsDropdown({
    super.key,
    required this.selectedSpecialization,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('التخصص', style: Styles.textStyle16Medium),
          SizedBox(height: 8.h),
          Container(
            height: 48.h,
            width: 335.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: Colors.grey.shade300, width: 1.5),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/bag.svg',
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text(
                          'اختر التخصص',
                          style: Styles.textStyle16Medium.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        value: selectedSpecialization,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: Constants.doctorSpecializations.map((gov) {
                          return DropdownMenuItem<String>(
                            value: gov,
                            child: Text(gov, style: Styles.textStyle16Medium),
                          );
                        }).toList(),
                        onChanged: onChanged,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
