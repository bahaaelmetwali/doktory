import 'dart:convert';

import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_information_widget.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/cubits/user_cubit/user_data_cubit.dart';
import 'package:doktory/features/shared/appointment/data/models/appointment_model.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_user_data_use_case.dart';
import 'package:doktory/features/user/user_appointments/presentation/widgets/custom_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ScheduleCard extends StatefulWidget {
  const ScheduleCard({super.key, required this.acceptedAppointment});
  final AppointmentModel acceptedAppointment;

  @override
  State<ScheduleCard> createState() => _ScheduleCardState();
}

class _ScheduleCardState extends State<ScheduleCard> {
  late String dateFormatted;
  late String timeFormatted;
  @override
  void initState() {
    super.initState();

    dateFormatted = DateFormat(
      'd MMMM y',
      'ar',
    ).format(widget.acceptedAppointment.appointmentDate);

    timeFormatted = DateFormat(
      'hh:mm a',
      'ar',
    ).format(widget.acceptedAppointment.appointmentDate);
  }

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
    return BlocProvider(
      create: (context) =>
          UserDataCubit(getIt<GetUserDataUseCase>())
            ..getUserData(widget.acceptedAppointment.userId),
      child: BlocBuilder<UserDataCubit, UserDataState>(
        builder: (context, state) {
          if (state is UserDataLoading) {
            return const ScheduleCardShimmer();
          } else if (state is UserDataFailure) {
            return Center(
              child: Text(state.message, style: Styles.textStyle16Medium),
            );
          } else if (state is UserDataSuccess) {
            final user = state.user;
            return CustomInformationWidget(
              content: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.r),
                    child: CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: getImage(user),

                      child: getImage(user) == null
                          ? Icon(
                              Icons.person,
                              size: 40.r,
                              color: Colors.grey.shade500,
                            )
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                CustomRow(title: 'اسم الشخص', information: user.name!),
                SizedBox(height: 10.h),
                CustomRow(title: 'رقم الهاتف', information: user.phone!),
                SizedBox(height: 10.h),
                CustomRow(title: 'تاريخ الحجز', information: dateFormatted),
                SizedBox(height: 10.h),
                CustomRow(title: 'الوقت', information: timeFormatted),
                SizedBox(height: 10.h),
              ],
              iconPath: 'assets/icons/information.svg',
              title: 'حجز',
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class ScheduleCardShimmer extends StatelessWidget {
  const ScheduleCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar shimmer
          Shimmer(
            child: Container(
              width: 90.r,
              height: 90.r,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ),

          SizedBox(height: 20.h),

          // 4 rows shimmer
          _rowShimmer(),
          SizedBox(height: 15.h),

          _rowShimmer(),
          SizedBox(height: 15.h),

          _rowShimmer(),
          SizedBox(height: 15.h),

          _rowShimmer(),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget _rowShimmer() {
    return Shimmer(
      child: Container(
        height: 22.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
