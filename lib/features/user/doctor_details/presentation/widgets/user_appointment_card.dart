import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_information_widget.dart';
import 'package:doktory/features/user/doctor_details/data/models/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class UserAppointmentCard extends StatelessWidget {
  const UserAppointmentCard({super.key, required this.appointment});
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
                appointment.doctorName,
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
                dateFormatted,
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
                'الوقت',
                style: Styles.textStyle14SemiBold.copyWith(color: Colors.grey),
              ),
              Spacer(),
              Text(
                timeFormatted,
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
                appointment.status[0].toUpperCase() +
                    appointment.status.substring(1), // أول حرف كبير
                style: Styles.textStyle14SemiBold.copyWith(
                  fontWeight: FontWeight.w500,
                  color: _getStatusColor(appointment.status),
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

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return Colors.green;
      case 'pending':
        return const Color.fromARGB(255, 204, 167, 33);
      case 'canceled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
