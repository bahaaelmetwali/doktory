import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/info_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserCard extends StatelessWidget {
  final String? imageUrl;
  final String name;
  final String date;
  final String time;
  final String phone;

  const UserCard({
    super.key,
    this.imageUrl,
    this.name = 'كريم السيد',
    this.date = 'نوفمبر 9, 2025',
    this.time = '5:00 PM',
    this.phone = '01090916865',
  });

  @override
  Widget build(BuildContext context) {
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
            backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
            child: imageUrl == null
                ? Icon(Icons.person, size: 40.r, color: Colors.grey.shade500)
                : null,
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Styles.textStyle16Medium,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),

                InfoRow(icon: Icons.calendar_month_rounded, text: date),
                SizedBox(height: 5.h),

                InfoRow(icon: Icons.timer_outlined, text: time),
                SizedBox(height: 5.h),

                InfoRow(icon: Icons.phone_enabled_rounded, text: phone),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
