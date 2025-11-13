import 'dart:convert';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/all_appointments/info_row.dart';
import 'package:doktory/features/shared/appointment/data/models/appointment_model.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class UserCard extends StatelessWidget {
  final AppointmentModel appointment;
  final UserModel user;
  final String? imageBase64; // الصورة في صيغة Base64

  const UserCard({
    super.key,
    required this.appointment,
    required this.user,
    this.imageBase64,
  });

  @override
  Widget build(BuildContext context) {
    final dateFormatted = DateFormat(
      'd MMMM y',
      'ar',
    ).format(appointment.appointmentDate);
    final timeFormatted = DateFormat(
      'hh:mm a',
      'ar',
    ).format(appointment.appointmentDate);

    ImageProvider? getImage() {
      if (user.image != null) {
        try {
          return MemoryImage(base64Decode(user.image!));
        } catch (_) {
          return null;
        }
      }
      return null;
    }

    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: getImage(),
            child: getImage() == null
                ? Icon(Icons.person, size: 40.r, color: Colors.grey.shade500)
                : null,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name!,
                  style: Styles.textStyle16Medium,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                InfoRow(
                  icon: Icons.calendar_month_rounded,
                  text: dateFormatted,
                ),
                SizedBox(height: 5.h),
                InfoRow(icon: Icons.timer_outlined, text: timeFormatted),
                SizedBox(height: 5.h),
                InfoRow(icon: Icons.phone_enabled_rounded, text: user.phone!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
