import 'package:doktory/core/widgets/custom_app_bar.dart';
import 'package:doktory/features/user/doctor_details/presentation/widgets/user_appointment_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserAppointmentsScreenBody extends StatelessWidget {
  const UserAppointmentsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(onTap: () {}, isBack: false, headingText: 'حجوزاتي'),
        Container(height: 20.h, color: Colors.white),

        Expanded(child: UserAppointmentsListView()),
      ],
    );
  }
}
