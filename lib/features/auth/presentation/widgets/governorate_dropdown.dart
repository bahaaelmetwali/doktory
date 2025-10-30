import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GovernorateDropdown extends StatelessWidget {
  final String? selectedGovernorate;
  final ValueChanged<String?> onChanged;

  const GovernorateDropdown({
    super.key,
    required this.selectedGovernorate,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('المحافظة', style: Styles.textStyle16Medium),
          SizedBox(height: 8.h),
          Container(
            height: 54.h,
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
                    'assets/icons/location.svg',
                    height: 20.h,
                    width: 20.w,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text(
                          'اختر المحافظة',
                          style: Styles.textStyle16Medium.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        value: selectedGovernorate,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: Constants.egyptGovernorates.map((gov) {
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
