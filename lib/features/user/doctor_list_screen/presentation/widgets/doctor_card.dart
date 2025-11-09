import 'dart:convert';
import 'dart:typed_data';
import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doctor});
  final UserModel doctor;

  @override
  Widget build(BuildContext context) {
    Uint8List? imageBytes;
    if (doctor.image != null && doctor.image!.isNotEmpty) {
      try {
        imageBytes = base64Decode(doctor.image!);
      } catch (e) {
        debugPrint("Error decoding image for ${doctor.name}: $e");
      }
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: imageBytes != null
                  ? Image.memory(
                      imageBytes,
                      height: 70.h,
                      width: 80.w,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/logos/doctor_test.jpg',
                      height: 70.h,
                      width: 80.w,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(width: 12.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'د. ${doctor.name ?? "غير معروف"}',
                    style: Styles.textStyle16Medium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    doctor.address ?? "لا يوجد عنوان محدد",
                    style: Styles.textStyle14Regular.copyWith(
                      color: Colors.grey[700],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10.h),

                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 18,
                          color: AppColors.primary,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'احجز',
                          style: Styles.textStyle12SemiBold.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
