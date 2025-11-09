// all_doctors_screen_body.dart
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/features/user/home/presentation/cubits/all_doctors/all_doctors_cubit.dart';
import 'package:doktory/features/user/home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllDoctorsScreenBody extends StatelessWidget {
  const AllDoctorsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<AllDoctorsCubit, AllDoctorsState>(
          builder: (context, state) {
            if (state is AllDoctorsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AllDoctorsError) {
              return Center(child: Text(state.message));
            } else if (state is AllDoctorsLoaded) {
              final doctors = state.doctors;

              if (doctors.isEmpty) {
                return Center(
                  child: Text(
                    'لا يوجد أطباء حالياً',
                    style: Styles.textStyle16Medium,
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.all(8.r),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return DoctorCard(doctor: doctor);
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
