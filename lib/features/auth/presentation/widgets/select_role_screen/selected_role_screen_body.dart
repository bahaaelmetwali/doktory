import 'package:doktory/core/constants.dart';
import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/core/utils/cache_helper.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_button.dart';
import 'package:doktory/features/auth/presentation/widgets/select_role_screen/role_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('اختر دورك', style: Styles.textStyle24SemiBold),
              SizedBox(height: 10.h),
              Text(
                'اختر الدور المناسب لتسجيل الدخول',
                style: Styles.textStyle20SemiBold.copyWith(
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.h),
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
                  SizedBox(width: 20.w),
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
              SizedBox(height: 40.h),
              CustomButton(
                onPressed: () async {
                  final cacheHelper = getIt<CacheHelper>();
                  await cacheHelper.saveRole(
                    role: isSelected ? 'دكتور' : 'عميل',
                  );
                  context.push(AppRouterNames.completeDataScreen);
                },
                text: 'تأكيد',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
