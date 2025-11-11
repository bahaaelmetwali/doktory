import 'dart:convert';
import 'package:doktory/core/constants.dart';
import 'package:doktory/features/user/doctor_details/data/models/appointment_model.dart';
import 'package:doktory/features/user/doctor_details/presentation/cubits/doctor_details/doctor_details_cubit.dart';
import 'package:doktory/features/user/doctor_details/presentation/cubits/doctor_details/doctor_details_state.dart';
import 'package:doktory/features/user/doctor_details/presentation/widgets/appointment_card_section.dart';
import 'package:doktory/features/user/doctor_details/presentation/widgets/location_doctor_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentDetailsSection extends StatelessWidget {
  const AppointmentDetailsSection({super.key, required this.appointment});

  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorDetailsCubit, DoctorDetailsState>(
      builder: (context, state) {
        if (state is DoctorDetailsLoading) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          );
        } else if (state is DoctorDetailsLoaded) {
          Widget doctorImage = const SizedBox();
          if (state.doctor.image != null && state.doctor.image!.isNotEmpty) {
            try {
              final bytes = base64Decode(state.doctor.image!);
              doctorImage = CircleAvatar(
                radius: 50.r,
                backgroundImage: MemoryImage(bytes),
              );
            } catch (e) {
              doctorImage = CircleAvatar(
                radius: 50.r,
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.person, size: 50.r, color: Colors.white),
              );
            }
          }

          return Column(
            children: [
              doctorImage,
              SizedBox(height: 10.h),
              AppointmentCardSection(appointment: appointment),
              SizedBox(height: 10.h),
              LocationDoctorSection(doctor: state.doctor),
            ],
          );
        } else if (state is DoctorDetailsError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
