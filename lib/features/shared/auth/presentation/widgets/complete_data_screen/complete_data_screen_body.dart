import 'dart:io';

import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/cache_helper.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/complete_user_data_cubit/complete_user_data_cubit.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/complete_data_screen/complete_data_process.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/complete_data_screen/get_location_section.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/complete_data_screen/governorate_dropdown.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/complete_data_screen/name_and_phone_text_fields_section.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/complete_data_screen/pick_image_section.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/complete_data_screen/specializations_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompleteDataScreenBody extends StatefulWidget {
  const CompleteDataScreenBody({super.key});

  @override
  State<CompleteDataScreenBody> createState() => _CompleteDataScreenBodyState();
}

class _CompleteDataScreenBodyState extends State<CompleteDataScreenBody> {
  @override
  void initState() {
    super.initState();
    final cache = getIt<CacheHelper>();
    selectedRole = cache.getRole();
  }

  LatLng? selectedLocation;
  String? adress;

  String? selectedRole;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  String? selectedSpecialization;
  String? selectedGovernorate;
  String? uploadedImageBase64;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteUserDataCubit, CompleteUserDataState>(
      builder: (context, state) {
        final isLoading = state is CompleteUserDataLoading;

        return AbsorbPointer(
          absorbing: isLoading,
          child: Form(
            key: _formKey,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Center(
                        child: Text(
                          ' ادخال البيانات',
                          style: Styles.textStyle24SemiBold.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      PickImageSection(
                        onImagePicked: (imageFile) {
                          uploadedImageBase64 = imageFile;
                        },
                      ),

                      NameandPhoneTextFieldsSection(
                        nameController: nameController,
                        phoneController: phoneController,
                      ),
                      GovernorateDropdown(
                        selectedGovernorate: selectedGovernorate,
                        onChanged: (value) {
                          setState(() {
                            selectedGovernorate = value;
                          });
                        },
                      ),
                      selectedRole == 'دكتور'
                          ? SpecializationsDropdown(
                              selectedSpecialization: selectedSpecialization,
                              onChanged: (value) {
                                setState(() {
                                  selectedSpecialization = value;
                                });
                              },
                            )
                          : SizedBox.shrink(),
                      selectedRole == 'دكتور'
                          ? GetLocationSection(
                              selectedLocation: selectedLocation,
                              adress: adress,
                              onLocationChanged:
                                  (LatLng newLocation, String newAddress) {
                                    setState(() {
                                      selectedLocation = newLocation;
                                      adress = newAddress;
                                    });
                                  },
                            )
                          : SizedBox.shrink(),
                      SizedBox(height: 10.h),
                      CompleteDataProcess(
                        formKey: _formKey,
                        nameController: nameController,
                        phoneController: phoneController,
                        selectedGovernorate: selectedGovernorate,
                        selectedRole: selectedRole,
                        selectedSpecialization: selectedSpecialization,
                        selectedLocation: selectedLocation,
                        address: adress,
                        uploadedImageUrl: uploadedImageBase64,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
