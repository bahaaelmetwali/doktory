import 'package:doktory/core/widgets/custom_app_bar.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/schedule/schedules_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleScreenBody extends StatelessWidget {
  const ScheduleScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(headingText: 'جدول الاعمال', isBack: false, onTap: null),
        Container(height: 20.h, color: Colors.white),
        Expanded(child: SchedulesListView()),
      ],
    );
  }
}
