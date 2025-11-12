import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/core/widgets/custom_button.dart';
import 'package:doktory/core/widgets/custom_loading_indicator.dart';
import 'package:doktory/core/widgets/show_custom_snack_bar.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/auth_check/auth_check_cubit.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/complete_user_data_cubit/complete_user_data_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompleteDataProcess extends StatelessWidget {
  const CompleteDataProcess({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
    required this.selectedGovernorate,
    required this.selectedRole,
    this.selectedSpecialization,
    this.selectedLocation,
    this.address,
    this.uploadedImageUrl,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final String? selectedGovernorate;
  final String? selectedRole;
  final String? selectedSpecialization;
  final LatLng? selectedLocation;
  final String? address;
  final String? uploadedImageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompleteUserDataCubit, CompleteUserDataState>(
      listener: (context, state) {
        if (state is CompleteUserDataSuccess) {
          showCustomSnackBar(context, message: 'تم تسجيل الدخول');
          if (selectedRole == 'دكتور') {
            context.go(AppRouterNames.allAppointmentsScreen);
          } else {
            context.go(AppRouterNames.homeUserScreen);
          }
        } else if (state is CompleteUserDataFailure) {
          showCustomSnackBar(context, message: state.message, isError: true);
        }
      },
      builder: (context, state) {
        if (state is CompleteUserDataLoading) {
          return Center(child: CustomLoadingIndicator());
        } else {
          return Center(
            child: CustomButton(
              text: 'تسجيل الدخول',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final firebaseAuth = getIt<FirebaseAuth>();
                  final currentUser = firebaseAuth.currentUser;

                  if (currentUser == null) {
                    showCustomSnackBar(
                      context,
                      message: 'حدث خطأ، يرجى تسجيل الدخول أولاً',
                      isError: true,
                    );
                    return;
                  }

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
                    image: uploadedImageUrl,
                  );

                  await context.read<CompleteUserDataCubit>().completeUserData(
                    user: userModel,
                  );
                  context.read<AuthCheckCubit>().updateUser(userModel);
                }
              },
            ),
          );
        }
      },
    );
  }
}
