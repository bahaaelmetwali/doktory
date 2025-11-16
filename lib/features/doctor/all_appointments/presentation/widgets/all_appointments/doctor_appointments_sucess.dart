import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/cubits/user_cubit/user_data_cubit.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/all_appointments/custom_doctor_buttons.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/all_appointments/user_card.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/all_appointments/user_card_loading_shimmer.dart';
import 'package:doktory/features/doctor/all_appointments/use_cases/update_appointment_status_use_case.dart';
import 'package:doktory/features/shared/appointment/data/models/appointment_model.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_user_data_use_case.dart';
import 'package:doktory/features/user/user_appointments/presentation/cubits/appointment_status/appointment_status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorAppointmentsSucess extends StatefulWidget {
  const DoctorAppointmentsSucess({
    super.key,
    required this.pendingAppointments,
  });

  final List<AppointmentModel> pendingAppointments;

  @override
  State<DoctorAppointmentsSucess> createState() =>
      _DoctorAppointmentsSucessState();
}

class _DoctorAppointmentsSucessState extends State<DoctorAppointmentsSucess> {
  late List<AppointmentModel> appointments;
  @override
  void initState() {
    super.initState();
    appointments = widget.pendingAppointments;
  }

  void removeAppointment(String appointmentId) {
    setState(() {
      appointments.removeWhere((element) => element.id == appointmentId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appointments.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final appointment = appointments[index];

        return BlocProvider(
          create: (context) =>
              UserDataCubit(getIt<GetUserDataUseCase>())
                ..getUserData(appointment.userId),
          child: BlocBuilder<UserDataCubit, UserDataState>(
            builder: (context, state) {
              Widget userCardContent;

              if (state is UserDataLoading) {
                userCardContent = UserCardLoadingShimmer();
              } else if (state is UserDataFailure) {
                userCardContent = Center(child: Text(state.message));
              } else if (state is UserDataSuccess) {
                final user = state.user;
                userCardContent = UserCard(
                  appointment: appointment,
                  user: user,
                );
              } else {
                userCardContent = const SizedBox.shrink();
              }

              return BlocProvider(
                create: (context) => AppointmentStatusCubit(
                  getIt<UpdateAppointmentStatusUseCase>(),
                ),
                child:
                    BlocListener<
                      AppointmentStatusCubit,
                      AppointmentStatusState
                    >(
                      listener: (context, state) {
                        if (state is AppointmentStatusSuccess) {
                          removeAppointment(appointment.id);
                        }
                      },
                      child: Column(
                        children: [
                          userCardContent,
                          SizedBox(height: 15.h),
                          CustomDoctorButtons(appointment: appointment),
                          SizedBox(height: 10.h),
                          Divider(
                            color: Colors.grey.shade300,
                            thickness: 1.25.h,
                          ),
                        ],
                      ),
                    ),
              );
            },
          ),
        );
      },
    );
  }
}
