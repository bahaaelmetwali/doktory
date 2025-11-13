import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/cubits/user_cubit/user_data_cubit.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/schedule/schedule_card_data.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/schedule/schedule_card_shimmer.dart';
import 'package:doktory/features/shared/appointment/data/models/appointment_model.dart';
import 'package:doktory/features/shared/auth/domain/usecases/get_user_data_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
            return ScheduleCardData(
              user: user,
              dateFormatted: dateFormatted,
              timeFormatted: timeFormatted,
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
