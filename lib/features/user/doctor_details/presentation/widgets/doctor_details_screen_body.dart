import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_app_bar.dart';
import 'package:doktory/core/widgets/custom_button.dart';
import 'package:doktory/core/widgets/custom_information_widget.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/complete_data_screen/shown_map_section.dart';
import 'package:flutter/material.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomAppBar(
                    onTap: () => Navigator.of(context).pop(),
                    headingText: 'المعلومات',
                  ),

                  SizedBox(height: 15.h),

                  /// --- معلومات الطبيب ---
                  CustomInformationWidget(
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
                                      imageBytes,
                                      height: 85.h,
                                      width: 85.w,
                                      fit: BoxFit.cover,
                                    )
                                  : Icon(
                                      Icons.person,
                                      size: 60.r,
                                      color: Colors.grey,
                                    ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                          style: Styles.textStyle14Regular
                                              .copyWith(
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
                  ),

                  SizedBox(height: 10.h),

                  CustomInformationWidget(
                    content: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_city_rounded,
                            color: AppColors.primary,
                            size: 20.r,
                          ),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: Text(
                              '${doctor.governorate}',
                              style: Styles.textStyle14Regular.copyWith(
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColors.primary,
                            size: 20.r,
                          ),
                          SizedBox(width: 6.w),
                          Expanded(
                            child: Text(
                              '${doctor.address}',
                              style: Styles.textStyle14Regular.copyWith(
                                fontSize: 14.sp,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),

                      if (doctor.latitude != null && doctor.longitude != null)
                        SizedBox(
                          height: 200.h,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: ShownMapSection(
                              selectedLocation: LatLng(
                                doctor.latitude!,
                                doctor.longitude!,
                              ),
                            ),
                          ),
                        ),
                    ],
                    iconPath: 'assets/icons/location.svg',
                    title: 'العنوان',
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(onPressed: () {}, text: 'احجز الان'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
