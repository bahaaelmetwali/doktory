// all_doctors_screen_body.dart
import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_app_bar.dart';
import 'package:doktory/core/widgets/custom_text_form_field.dart';
import 'package:doktory/features/user/home/presentation/cubits/all_doctors/all_doctors_cubit.dart';
import 'package:doktory/features/user/home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllDoctorsScreenBody extends StatefulWidget {
  const AllDoctorsScreenBody({super.key});

  @override
  State<AllDoctorsScreenBody> createState() => _AllDoctorsScreenBodyState();
}

class _AllDoctorsScreenBodyState extends State<AllDoctorsScreenBody> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          CustomAppBar(
            onTap: () => Navigator.pop(context),
            headingText: 'كل الأطباء',
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Center(
              child: CustomTextFormField(
                name: '',
                hintText: 'ابحث عن طبيب',
                iconPath: 'assets/icons/search.svg',
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.trim().toLowerCase();
                  });
                },
              ),
            ),
          ),

          Expanded(
            child: BlocBuilder<AllDoctorsCubit, AllDoctorsState>(
              builder: (context, state) {
                if (state is AllDoctorsLoading) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                } else if (state is AllDoctorsError) {
                  return Center(child: Text(state.message));
                } else if (state is AllDoctorsLoaded) {
                  final filteredDoctors = state.doctors
                      .where(
                        (doctor) =>
                            doctor.name != null &&
                            doctor.name!.toLowerCase().contains(searchQuery),
                      )
                      .toList();

                  if (filteredDoctors.isEmpty) {
                    return Center(
                      child: Text(
                        'لا يوجد أطباء مطابقين للبحث',
                        style: Styles.textStyle16Medium,
                      ),
                    );
                  }

                  return ListView.builder(
                    padding: EdgeInsets.all(8.r),
                    itemCount: filteredDoctors.length,
                    itemBuilder: (context, index) {
                      final doctor = filteredDoctors[index];
                      return DoctorCard(doctor: doctor);
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
