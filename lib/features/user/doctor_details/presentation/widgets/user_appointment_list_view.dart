import 'package:doktory/core/constants.dart';
import 'package:doktory/core/widgets/show_custom_snack_bar.dart';
import 'package:doktory/features/user/doctor_details/presentation/cubits/get_user_appointments_/get_user_appointments_cubit.dart';
import 'package:doktory/features/user/doctor_details/presentation/widgets/user_appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAppointmentsListView extends StatelessWidget {
  const UserAppointmentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetUserAppointmentsCubit, GetUserAppointmentsState>(
      listener: (context, state) {
        if (state is GetUserAppointmentsError) {
          showCustomSnackBar(context, message: state.message, isError: true);
        }
      },
      builder: (context, state) {
        if (state is GetUserAppointmentsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        } else if (state is GetUserAppointmentsLoaded) {
          final appointments = state.appointments;
          print('📦 عدد المواعيد: ${appointments.length}');

          if (appointments.isEmpty) {
            return const Center(child: Text('لا يوجد حجوزات حتى الآن'));
          }

          return ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              return UserAppointmentCard(appointment: appointment);
            },
          );
        } else {
          return const Center(child: Text('لا يوجد حجوزات حتى الآن'));
        }
      },
    );
  }
}
