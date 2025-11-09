import 'package:doktory/core/constants.dart';
import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/user/home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key, required this.doctors});
  final List<UserModel> doctors;
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
                onPressed: () {
                  context.push(AppRouterNames.allDoctorsScreen);
                },
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
          doctors.isEmpty
              ? Center(
                  child: Text(
                    'لا يوجد أطباء حالياً',
                    style: Styles.textStyle16Medium,
                  ),
                )
              : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: doctors.length < 10 ? doctors.length : 10,
                  itemBuilder: (context, index) {
                    return DoctorCard(doctor: doctors[index]);
                  },
                ),
        ],
      ),
    );
  }
}
