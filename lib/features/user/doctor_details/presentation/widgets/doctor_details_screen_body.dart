import 'package:doktory/core/utils/get_time.dart';
import 'package:doktory/core/widgets/custom_app_bar.dart';
import 'package:doktory/core/widgets/custom_button.dart';
import 'package:doktory/features/user/doctor_details/presentation/widgets/information_doctor_section.dart';
import 'package:doktory/features/user/doctor_details/presentation/widgets/location_doctor_section.dart';
import 'package:flutter/material.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:typed_data';
import 'dart:convert';

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
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomAppBar(
              onTap: () => Navigator.of(context).pop(),
              headingText: 'المعلومات',
            ),
            Container(height: 10.h, color: Colors.white),

            Padding(
              padding: EdgeInsets.all(12.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),

                  InformationDoctorSection(
                    imageBytes: imageBytes,
                    doctor: doctor,
                  ),

                  SizedBox(height: 10.h),

                  LocationDoctorSection(doctor: doctor),
                  SizedBox(height: 20.h),
                  AddAppointmentProcess(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddAppointmentProcess extends StatelessWidget {
  const AddAppointmentProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () async {
        DateTime? selectedDate = await GetTime.selectDate(context);

        if (selectedDate == null) return;

        TimeOfDay? selectedTime = await GetTime.selectTime(context);

        if (selectedTime == null) return;

        final appointmentDateTime = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('تم الحجز بنجاح!')));
      },
      text: 'احجز الان',
    );
  }
}
