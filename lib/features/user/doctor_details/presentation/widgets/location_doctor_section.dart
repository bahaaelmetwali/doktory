import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_information_widget.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/complete_data_screen/shown_map_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationDoctorSection extends StatelessWidget {
  const LocationDoctorSection({super.key, required this.doctor});

  final UserModel doctor;

  @override
  Widget build(BuildContext context) {
    return CustomInformationWidget(
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
                style: Styles.textStyle14Regular.copyWith(fontSize: 14.sp),
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
                style: Styles.textStyle14Regular.copyWith(fontSize: 14.sp),
                softWrap: true,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),

        if (doctor.latitude != null && doctor.longitude != null)
          SizedBox(
            height: 180.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: ShownMapSection(
                selectedLocation: LatLng(doctor.latitude!, doctor.longitude!),
              ),
            ),
          ),
      ],
      iconPath: 'assets/icons/location.svg',
      title: 'العنوان',
    );
  }
}
