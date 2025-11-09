import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeBannerSection extends StatelessWidget {
  const WelcomeBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Container(
        height: 150.h,
        width: 355.w,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0.h,
              child: SizedBox(
                height: 160.h,
                child: Image.asset('assets/logos/doctor.png'),
              ),
            ),

            Positioned(
              top: 40.h,
              right: 5.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مرحبًا بك في دكتوري !',
                    style: Styles.textStyle20SemiBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'صحتك تهمنا، استشر طبيبك في أي وقت',
                    style: Styles.textStyle14SemiBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
