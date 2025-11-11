import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_app_bar.dart';
import 'package:doktory/core/widgets/custom_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAppointmentsScreenBody extends StatelessWidget {
  const UserAppointmentsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    // بيانات تجريبية
    final List<Map<String, String>> appointments = [
      {
        'doctorName': 'د. أحمد',
        'date': '2025-11-12 10:00',
        'status': 'pending',
      },
      {
        'doctorName': 'د. سارة',
        'date': '2025-11-13 14:00',
        'status': 'confirmed',
      },
      {
        'doctorName': 'د. كريم',
        'date': '2025-11-14 09:30',
        'status': 'canceled',
      },
    ];

    return Column(
      children: [
        CustomAppBar(onTap: () {}, isBack: false, headingText: 'حجوزاتي'),
        Container(height: 10.h, color: Colors.white),

        Expanded(
          child: ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              return CustomInformationWidget(
                content: [
                  Row(
                    children: [
                      Text(
                        'رقم الطلب',
                        style: Styles.textStyle14SemiBold.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '#123456',
                        style: Styles.textStyle16Medium.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        'تاريخ الطلب',
                        style: Styles.textStyle16Medium.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '28 يوليو 2024',
                        style: Styles.textStyle16Medium.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        'تاريخ الطلب',
                        style: Styles.textStyle14SemiBold.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'جديد',
                        style: Styles.textStyle14SemiBold.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff34C759),
                        ),
                      ),
                    ],
                  ),
                ],
                iconPath: 'assets/icons/information.svg',
                title: 'بيانات الحجز',
              );
            },
          ),
        ),
      ],
    );
  }
}
