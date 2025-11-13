import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/cubits/doctor_appointments/doctor_appointments_cubit.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/cubits/doctor_appointments/doctor_appointments_state.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/all_appointments/doctor_appointments_sucess.dart';
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
                return Center(
                  child: Text(
                    'حدث خطأ: ${state.message}',
                    style: Styles.textStyle16Medium,
                  ),
                );
              } else if (state is DoctorAppointmentsSuccess) {
                final pendingAppointments = state.appointments
                    .where(
                      (appointment) => appointment.status == "قيد الانتظار",
                    )
                    .toList();
                return pendingAppointments.isEmpty
                    ? Center(
                        child: Text(
                          'لا توجد حجوزات قيد الانتظار',
                          style: Styles.textStyle16Medium,
                        ),
                      )
                    : DoctorAppointmentsSucess(
                        pendingAppointments: pendingAppointments,
                      );
              } else {
                return Center(
                  child: Text(
                    'لا توجد حجوزات',
                    style: Styles.textStyle16Medium,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
