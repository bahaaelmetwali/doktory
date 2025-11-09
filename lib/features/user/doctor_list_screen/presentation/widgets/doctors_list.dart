import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/features/user/doctor_list_screen/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Column(
        children: [
          Row(
            children: [
              Text('كل الأطباء', style: Styles.textStyle18SemiBold),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  'عرض الكل',
                  style: Styles.textStyle14SemiBold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return DoctorCard();
            },
          ),
        ],
      ),
    );
  }
}
