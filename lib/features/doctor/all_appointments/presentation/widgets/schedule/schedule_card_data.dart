import 'dart:convert';

import 'package:doktory/core/widgets/custom_information_widget.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/user/user_appointments/presentation/widgets/custom_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleCardData extends StatelessWidget {
  const ScheduleCardData({
    super.key,
    required this.user,
    required this.dateFormatted,
    required this.timeFormatted,
  });
  final UserModel user;
  final String dateFormatted;
  final String timeFormatted;
  ImageProvider? getImage(UserModel user) {
    if (user.image != null) {
      try {
        return MemoryImage(base64Decode(user.image!));
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return CustomInformationWidget(
      content: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(8.r),
            child: CircleAvatar(
              radius: 40.r,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: getImage(user),

              child: getImage(user) == null
                  ? Icon(Icons.person, size: 40.r, color: Colors.grey.shade500)
                  : null,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        CustomRow(title: 'اسم الشخص', information: user.name!),
        SizedBox(height: 10.h),
        CustomRow(title: 'رقم الهاتف', information: user.phone!),
        SizedBox(height: 10.h),
        CustomRow(title: 'تاريخ الحجز', information: dateFormatted),
        SizedBox(height: 10.h),
        CustomRow(title: 'الوقت', information: timeFormatted),
        SizedBox(height: 10.h),
      ],
      iconPath: 'assets/icons/information.svg',
      title: 'حجز',
    );
    ;
  }
}
