import 'package:doktory/features/doctor/all_appointments/presentation/widgets/action_button.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmittedOffersSection extends StatelessWidget {
  const SubmittedOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  UserCard(),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionButton(text: 'قبول', onTap: () {}),
                      SizedBox(width: 30.w),
                      ActionButton(text: 'رفض', isFilled: false, onTap: () {}),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Divider(color: Colors.grey.shade300, thickness: 1.25.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
