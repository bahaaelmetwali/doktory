import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/cache_helper.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/utils/validator.dart';
import 'package:doktory/core/widgets/custom_text_form_field.dart';
import 'package:doktory/features/auth/presentation/widgets/complete_data_screen/get_location_section.dart';
import 'package:doktory/features/auth/presentation/widgets/complete_data_screen/governorate_dropdown.dart';
import 'package:doktory/features/auth/presentation/widgets/complete_data_screen/pick_image_section.dart';
import 'package:doktory/features/auth/presentation/widgets/complete_data_screen/specializations_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              PickImageSection(),

              CustomTextFormField(
                controller: nameController,
                hintText: ' الاسم',
                name: ' الاسم',

                iconPath: 'assets/icons/profile.svg',
                validator: Validator.nameValidator,
              ),

              CustomTextFormField(
                controller: phoneController,
                hintText: 'رقم الهاتف',
                name: 'رقم الهاتف',
                iconPath: 'assets/icons/call.svg',
                validator: Validator.passwordValidator,
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
                  ? GetLocationSection()
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
