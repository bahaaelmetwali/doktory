import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/cubits/doctor_appointments/doctor_appointments_cubit.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/cubits/doctor_appointments/doctor_appointments_state.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/cubits/user_cubit/user_data_cubit.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/action_button.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/user_card.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_user_data_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubmittedOffersSection extends StatelessWidget {
  const SubmittedOffersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: BlocBuilder<DoctorAppointmentsCubit, DoctorAppointmentsState>(
            builder: (context, state) {
              if (state is DoctorAppointmentsLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              } else if (state is DoctorAppointmentsFailure) {
                return Center(child: Text('حدث خطأ: ${state.message}'));
              } else if (state is DoctorAppointmentsSuccess) {
                final pendingAppointments = state.appointments
                    .where(
                      (appointment) => appointment.status == "قيد الانتظار",
                    )
                    .toList();

                return ListView.builder(
                  itemCount: pendingAppointments.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final appointment = pendingAppointments[index];

                    return BlocProvider(
                      create: (context) =>
                          UserDataCubit(getIt<GetUserDataUseCase>())
                            ..getUserData(appointment.userId),
                      child: BlocBuilder<UserDataCubit, UserDataState>(
                        builder: (context, state) {
                          Widget userCardContent;

                          if (state is UserDataLoading) {
                            userCardContent = const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            );
                          } else if (state is UserDataFailure) {
                            userCardContent = Center(
                              child: Text(state.message),
                            );
                          } else if (state is UserDataSuccess) {
                            final user = state.user;
                            userCardContent = UserCard(
                              appointment: appointment,
                              user: user,
                            );
                          } else {
                            userCardContent = const SizedBox.shrink();
                          }

                          return Column(
                            children: [
                              userCardContent,
                              SizedBox(height: 15.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ActionButton(
                                    text: 'قبول',
                                    onTap: () {
                                      // هنظبط القبول بعدين
                                    },
                                  ),
                                  SizedBox(width: 30.w),
                                  ActionButton(
                                    text: 'رفض',
                                    isFilled: false,
                                    onTap: () {
                                      // هنظبط الرفض بعدين
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Divider(
                                color: Colors.grey.shade300,
                                thickness: 1.25.h,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
