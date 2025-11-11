import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/core/widgets/custom_app_bar.dart';
import 'package:doktory/features/user/doctor_details/data/models/appointment_model.dart';
import 'package:doktory/features/user/doctor_details/domain/usecases/get_doctor_use_case.dart';
import 'package:doktory/features/user/doctor_details/presentation/cubits/doctor_details/doctor_details_cubit.dart';
import 'package:doktory/features/user/doctor_details/presentation/cubits/doctor_details/doctor_details_state.dart';
import 'package:doktory/features/user/doctor_details/presentation/widgets/appointment_card_section.dart';
import 'package:doktory/features/user/doctor_details/presentation/widgets/location_doctor_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({super.key, required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          DoctorDetailsCubit(getIt<GetDoctorDataUseCase>())
            ..fetchDoctor(appointment.doctorId),
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              CustomAppBar(
                onTap: () => Navigator.pop(context),
                headingText: 'تفاصيل الحجز',
              ),
              Container(height: 20.h, color: Colors.white),
              Padding(
                padding: EdgeInsets.all(12.r),
                child: AppointmentCardSection(appointment: appointment),
              ),
              BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
                builder: (context, state) {
                  if (state is DoctorDetailsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  } else if (state is DoctorDetailsLoaded) {
                    return LocationDoctorSection(doctor: state.doctor);
                  } else if (state is DoctorDetailsError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
