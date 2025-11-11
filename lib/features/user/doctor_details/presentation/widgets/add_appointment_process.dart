import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/core/utils/get_time.dart';
import 'package:doktory/core/widgets/custom_button.dart';
import 'package:doktory/core/widgets/custom_loading_indicator.dart';
import 'package:doktory/core/widgets/show_custom_snack_bar.dart';
import 'package:doktory/features/user/doctor_details/presentation/cubits/appointment/appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddAppointmentProcess extends StatelessWidget {
  const AddAppointmentProcess({super.key, required this.doctor});
  final doctor;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentCubit, AppointmentState>(
      listener: (context, state) {
        if (state is AppointmentSuccess) {
          showCustomSnackBar(context, message: 'تم الحجز بنجاح');
          context.go(AppRouterNames.homeUserScreen);
        } else if (state is AppointmentFailure) {
          showCustomSnackBar(
            context,
            message: 'حدث خطأ: ${state.error}',
            isError: true,
          );
        }
      },
      builder: (context, state) {
        if (state is AppointmentLoading) {
          return CustomLoadingIndicator();
        } else {
          return CustomButton(
            onPressed: () async {
              DateTime? selectedDate = await GetTime.selectDate(context);

              if (selectedDate == null) return;

              TimeOfDay? selectedTime = await GetTime.selectTime(context);

              if (selectedTime == null) return;

              final appointmentDateTime = DateTime(
                selectedDate.year,
                selectedDate.month,
                selectedDate.day,
                selectedTime.hour,
                selectedTime.minute,
              );
              await context.read<AppointmentCubit>().bookAppointment(
                doctor: doctor,
                selectedDateTime: appointmentDateTime,
              );
            },
            text: 'احجز الان',
          );
        }
      },
    );
  }
}
