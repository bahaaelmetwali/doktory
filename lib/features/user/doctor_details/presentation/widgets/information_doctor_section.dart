import 'dart:typed_data';

import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_information_widget.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InformationDoctorSection extends StatelessWidget {
  const InformationDoctorSection({
    super.key,
    required this.imageBytes,
    required this.doctor,
  });

  final Uint8List? imageBytes;
  final UserModel doctor;

  @override
  Widget build(BuildContext context) {
    return CustomInformationWidget(
      content: [
        Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.r),
                child: imageBytes != null
                    ? Image.memory(
                        imageBytes!,
                        height: 85.h,
                        width: 85.w,
                        fit: BoxFit.cover,
                      )
                    : Icon(Icons.person, size: 60.r, color: Colors.grey),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'د. ${doctor.name}',
                      style: Styles.textStyle20SemiBold.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      '${doctor.specialization}',
                      style: Styles.textStyle14Regular.copyWith(
                        fontSize: 14.sp,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone_rounded,
                          color: AppColors.primary,
                          size: 18.r,
                        ),
                        SizedBox(width: 4.w),
                        Flexible(
                          child: Text(
                            '${doctor.phone}',
                            style: Styles.textStyle14Regular.copyWith(
                              fontSize: 14.sp,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
      iconPath: 'assets/icons/profile.svg',
      title: 'المعلومات الشخصية',
    );
  }
}
