import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/core/widgets/custom_app_bar.dart';
import 'package:doktory/core/widgets/more_option_group.dart';
import 'package:doktory/core/widgets/more_option_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MoreScreenBody extends StatelessWidget {
  const MoreScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(onTap: () {}, headingText: 'المزيد', isBack: false),
        Container(color: Colors.white, height: 20.h),
        Center(
          child: MoreOptionsGroup(
            children: [
              MoreOptionItem(
                iconPath: 'assets/icons/profile.svg',
                label: 'الملف الشخصي',
                onTap: () {},
              ),
              MoreOptionItem(
                iconPath: 'assets/icons/information.svg',
                label: 'الشروط والاحكام',
                onTap: () {
                  context.push(AppRouterNames.termsAndConditionsScreen);
                },
              ),

              MoreOptionItem(
                iconPath: 'assets/icons/security-safe.svg',
                label: 'سياسة الخصوصيه',
                onTap: () {
                  context.push(AppRouterNames.privacyPolicyScreen);
                },
              ),
              MoreOptionItem(
                iconPath: 'assets/icons/logout.svg',
                label: 'تسجيل الخروج',
                iconColor: Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
