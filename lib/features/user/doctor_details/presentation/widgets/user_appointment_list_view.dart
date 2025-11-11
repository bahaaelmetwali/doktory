import 'package:doktory/core/widgets/show_custom_snack_bar.dart';
import 'package:doktory/features/user/doctor_details/presentation/cubits/get_user_appointments_/get_user_appointments_cubit.dart';
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
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetUserAppointmentsLoaded) {
          final user = state.user;
          final appointments = state.appointments;

          if (appointments.isEmpty) {
            return const Center(child: Text('لا يوجد حجوزات حتى الآن'));
          }

          return ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index];
              return ListTile(
                title: Text(appointment.doctorName),
                subtitle: Text(
                  "${appointment.appointmentDate.toLocal()} - ${appointment.status}",
                ),
              );
            },
          );
        } else {
          return const Center(child: Text('اضغط للتحديث'));
        }
      },
    );
  }
}
