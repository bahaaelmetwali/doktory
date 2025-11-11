import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAppointmentCard extends StatelessWidget {
  const UserAppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: CustomInformationWidget(
        content: [
          Row(
            children: [
              Text(
                'اسم الدكتور',
                style: Styles.textStyle14SemiBold.copyWith(color: Colors.grey),
              ),
              Spacer(),
              Text(
                'أحمد',
                style: Styles.textStyle14SemiBold.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Text(
                'التخصص',
                style: Styles.textStyle14SemiBold.copyWith(color: Colors.grey),
              ),
              Spacer(),
              Text(
                'باطنة',
                style: Styles.textStyle14SemiBold.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),
          Row(
            children: [
              Text(
                'تاريخ الحجز',
                style: Styles.textStyle14SemiBold.copyWith(color: Colors.grey),
              ),
              Spacer(),
              Text(
                '28 يوليو 2024',
                style: Styles.textStyle14SemiBold.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: 10.h),
          Row(
            children: [
              Text(
                'حالة الطلب',
                style: Styles.textStyle14SemiBold.copyWith(color: Colors.grey),
              ),
              Spacer(),
              Text(
                'انتظار',
                style: Styles.textStyle14SemiBold.copyWith(
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 204, 167, 33),
                ),
              ),
            ],
          ),
        ],
        iconPath: 'assets/icons/information.svg',
        title: 'بيانات الحجز',
      ),
    );
  }
}
