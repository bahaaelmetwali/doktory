import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_button.dart';
import 'package:doktory/features/splash/widgets/role_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedRoleScreenBody extends StatefulWidget {
  const SelectedRoleScreenBody({super.key});

  @override
  State<SelectedRoleScreenBody> createState() => _SelectedRoleScreenBodyState();
}

class _SelectedRoleScreenBodyState extends State<SelectedRoleScreenBody> {
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('اختر دورك', style: Styles.textStyle28SemiBold),
            SizedBox(height: 10.h),
            Text(
              'اختر الدور المناسب لتسجيل الدخول',
              style: Styles.textStyle24SemiBold.copyWith(
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoleCard(
                  iconPath: 'assets/icons/doctor.svg',
                  label: 'دكتور',
                  onTap: () {
                    setState(() {
                      isSelected = true;
                    });
                  },
                  isSelected: isSelected,
                ),
                SizedBox(width: 10.w),
                RoleCard(
                  iconPath: 'assets/icons/client.svg',
                  label: 'عميل',
                  onTap: () {
                    setState(() {
                      isSelected = false;
                    });
                  },
                  isSelected: !isSelected,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            CustomButton(onPressed: () {}, text: 'تأكيد'),
          ],
        ),
      ),
    );
  }
}
