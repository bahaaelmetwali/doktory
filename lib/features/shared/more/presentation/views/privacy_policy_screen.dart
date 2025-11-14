import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: Column(
          children: [
            CustomAppBar(
              onTap: () {
                Navigator.pop(context);
              },
              headingText: 'سياسة الخصوصيه',
            ),
            Container(color: Colors.white, height: 20.h),
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Text(
                Constants.privacyPolicyViewText,
                style: Styles.textStyle14SemiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
