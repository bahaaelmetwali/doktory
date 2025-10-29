import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/features/splash/widgets/role_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectRoleScreen extends StatelessWidget {
  const SelectRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('اختر دورك', style: Styles.textStyle28SemiBold),
            SizedBox(height: 10.h),
            Text(
              'اختر الدور المناسب لتسجيل الدخول',
              style: Styles.textStyle24SemiBold,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoleCard(
                  iconPath: 'assets/icons/doctor.svg',
                  label: 'دكتور',
                  onTap: () {},
                ),
                SizedBox(width: 10.w),
                RoleCard(
                  iconPath: 'assets/icons/client.svg',
                  label: 'عميل',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
