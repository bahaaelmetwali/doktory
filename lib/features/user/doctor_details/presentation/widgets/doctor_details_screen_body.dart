import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_app_bar.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/complete_data_screen/shown_map_section.dart';
import 'package:flutter/material.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:typed_data';
import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorDetailsScreenBody extends StatelessWidget {
  final UserModel doctor;
  const DoctorDetailsScreenBody({super.key, required this.doctor});

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

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              onTap: () {
                Navigator.of(context);
              },
              headingText: 'الطبيب',
            ),
            Container(color: Colors.white, height: 10.h),
            SizedBox(height: 10.h),

            Padding(
              padding: EdgeInsets.all(16.r),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.r),
                    child: imageBytes != null
                        ? Image.memory(
                            imageBytes,
                            height: 85.h,
                            width: 85.w,
                            fit: BoxFit.cover,
                          )
                        : Icon(Icons.person, size: 50.r, color: Colors.grey),
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        'د. ${doctor.name}',
                        style: Styles.textStyle20SemiBold,
                      ),
                      SizedBox(height: 4.h),

                      Text(
                        '${doctor.specialization}',
                        style: Styles.textStyle14Regular.copyWith(
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(
                            Icons.phone_rounded,
                            color: AppColors.primary,
                            size: 20.r,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            '${doctor.phone}',
                            style: Styles.textStyle14Regular.copyWith(
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 10.h),

            // المحافظة
            Text(
              'المحافظة: ${doctor.governorate ?? "-"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5.h),

            // العنوان
            Text(
              'العنوان: ${doctor.address ?? "-"}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10.h),

            // خريطة الموقع
            if (doctor.latitude != null && doctor.longitude != null)
              ShownMapSection(
                selectedLocation: LatLng(doctor.latitude!, doctor.longitude!),
              ),

            SizedBox(height: 20.h),

            // زر الحجز
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // هنا تضيف عملية الحجز
                },
                child: Text('احجز مع الدكتور'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
