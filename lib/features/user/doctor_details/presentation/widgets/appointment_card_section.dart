import 'package:doktory/core/constants.dart';
import 'package:doktory/core/widgets/custom_information_widget.dart';
import 'package:doktory/features/user/doctor_details/data/models/appointment_model.dart';
import 'package:doktory/features/user/doctor_details/presentation/widgets/custom_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppointmentCardSection extends StatelessWidget {
  const AppointmentCardSection({super.key, required this.appointment});

  final AppointmentModel appointment;

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
    return CustomInformationWidget(
      content: [
        CustomRow(title: 'اسم الدكتور', information: appointment.doctorName),
        SizedBox(height: 10.h),
        CustomRow(title: 'التخصص', information: appointment.specialization!),
        SizedBox(height: 10.h),
        CustomRow(title: 'تاريخ الحجز', information: dateFormatted),
        SizedBox(height: 10.h),
        CustomRow(title: 'الوقت', information: timeFormatted),
        SizedBox(height: 10.h),
        CustomRow(
          title: 'حالة الطلب',
          information: appointment.status,
          infoColor: AppColors.getStatusColor(appointment.status),
        ),
      ],
      iconPath: 'assets/icons/information.svg',
      title: 'بيانات الحجز',
    );
  }
}
