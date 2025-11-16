import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/cubits/doctor_appointments/doctor_appointments_cubit.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/cubits/doctor_appointments/doctor_appointments_state.dart';
import 'package:doktory/features/doctor/schedule/schedule_card.dart';
import 'package:doktory/features/shared/appointment/data/models/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SchedulesListView extends StatelessWidget {
  const SchedulesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAppointmentsCubit, DoctorAppointmentsState>(
      builder: (context, state) {
        if (state is DoctorAppointmentsFailure) {
          return Center(
            child: Text(state.message, style: Styles.textStyle16Medium),
          );
        } else if (state is DoctorAppointmentsLoading) {
          return Center(
            child: SizedBox(
              width: 30.r,
              height: 30.r,
              child: CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 3.r,
              ),
            ),
          );
        } else if (state is DoctorAppointmentsSuccess) {
          List<AppointmentModel> acceptedAppointments = state.appointments
              .where((appointment) => appointment.status == 'مقبول')
              .toList();
          return ListView.builder(
            shrinkWrap: true,
            itemCount: acceptedAppointments.length,
            itemBuilder: (context, index) {
              return ScheduleCard(
                acceptedAppointment: acceptedAppointments[index],
              );
            },
          );
        } else {
          return Center(
            child: Text('لا توجد حجوزات', style: Styles.textStyle16Medium),
          );
        }
      },
    );
  }
}
