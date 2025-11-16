import 'dart:convert';

import 'package:doktory/core/widgets/custom_app_bar.dart';
import 'package:doktory/core/widgets/custom_information_widget.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/user/doctor_details/presentation/widgets/location_doctor_section.dart';
import 'package:doktory/features/user/user_appointments/presentation/widgets/custom_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ShowUserProfileScreenBody extends StatelessWidget {
  const ShowUserProfileScreenBody({super.key, required this.user});
  final UserModel user;
  ImageProvider? getImage(UserModel user) {
    if (user.image != null) {
      try {
        return MemoryImage(base64Decode(user.image!));
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          CustomAppBar(
            onTap: () {
              context.pop();
            },
            headingText: 'الملف الشخص',
          ),
          Container(color: Colors.white, height: 20.h),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: getImage(user),
                      child: getImage(user) == null
                          ? Icon(
                              Icons.person,
                              size: 50.r,
                              color: Colors.grey.shade500,
                            )
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                CustomInformationWidget(
                  content: [
                    CustomRow(title: 'الاسم ', information: user.name!),
                    SizedBox(height: 5.h),
                    CustomRow(title: 'رقم الهاتف', information: user.phone!),
                    SizedBox(height: 5.h),
                    CustomRow(
                      title: ' المحافظة',
                      information: user.governorate!,
                    ),
                    SizedBox(height: 5.h),
                    CustomRow(title: 'الدور', information: user.role!),
                    SizedBox(height: 5.h),
                    user.specialization == null
                        ? SizedBox.shrink()
                        : CustomRow(
                            title: 'التخصص',
                            information: user.specialization!,
                          ),
                  ],
                  iconPath: 'assets/icons/profile.svg',
                  title: "البيانات الشخصية",
                ),
                user.role == 'دكتور'
                    ? LocationDoctorSection(doctor: user)
                    : SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
