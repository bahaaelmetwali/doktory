import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/cache_helper.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_button.dart';
import 'package:doktory/core/widgets/custom_loading_indicator.dart';
import 'package:doktory/core/widgets/show_custom_snack_bar.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/complete_user_data_cubit/complete_user_data_cubit.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/complete_data_screen/get_location_section.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/complete_data_screen/governorate_dropdown.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/complete_data_screen/name_and_phone_text_fields_section.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/complete_data_screen/pick_image_section.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/complete_data_screen/specializations_dropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  @override
  Widget build(BuildContext context) {
    return Directionality(
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
              selectedRole == 'دكتور' ? PickImageSection() : SizedBox.shrink(),

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
              CompleteDataSource(
                formKey: _formKey,
                nameController: nameController,
                phoneController: phoneController,
                selectedGovernorate: selectedGovernorate,
                selectedRole: selectedRole,
                selectedSpecialization: selectedSpecialization,
                selectedLocation: selectedLocation,
                address: adress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompleteDataSource extends StatelessWidget {
  const CompleteDataSource({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.selectedGovernorate,
    required this.selectedRole,
    this.selectedSpecialization,
    this.selectedLocation,
    this.address,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final String? selectedGovernorate;
  final String? selectedRole;
  final String? selectedSpecialization;
  final LatLng? selectedLocation;
  final String? address;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteUserDataCubit, CompleteUserDataState>(
      listener: (context, state) {
        if (state is CompleteUserDataSuccess) {
          showCustomSnackBar(context, message: 'تم تسجيل الدخول');
        } else if (state is CompleteUserDataFailure) {
          showCustomSnackBar(context, message: state.message, isError: true);
        }
      },
      builder: (context, state) {
        if (state is CompleteUserDataSuccess) {
          return CustomLoadingIndicator();
        } else {
          return Center(
            child: CustomButton(
              text: 'تسجيل الدخول',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final firebaseAuth = getIt<FirebaseAuth>();
                  final currentUser = firebaseAuth.currentUser!;

                  final userModel = UserModel(
                    uid: currentUser.uid,
                    email: currentUser.email ?? '',
                    name: nameController.text.trim(),
                    phone: phoneController.text.trim(),
                    governorate: selectedGovernorate,
                    role: selectedRole,
                    specialization: selectedRole == 'دكتور'
                        ? selectedSpecialization
                        : null,
                    address: selectedRole == 'دكتور' ? address : null,
                    latitude: selectedRole == 'دكتور'
                        ? selectedLocation?.latitude
                        : null,
                    longitude: selectedRole == 'دكتور'
                        ? selectedLocation?.longitude
                        : null,
                  );
                  context.read<CompleteUserDataCubit>().completeUserData(
                    user: userModel,
                  );
                }
              },
            ),
          );
        }
      },
    );
  }
}
