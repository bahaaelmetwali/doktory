import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/cache_helper.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_button.dart';
import 'package:doktory/core/widgets/show_or_hide_pass.dart';
import 'package:doktory/features/auth/presentation/widgets/governorate_dropdown.dart';
import 'package:doktory/features/auth/presentation/widgets/specializations_dropdown.dart';
import 'package:doktory/features/auth/presentation/widgets/text_fields_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  void initState() {
    final cache = getIt<CacheHelper>();
    final role = cache.getRole();
    selectedRole = role;
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  String? selectedRole;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  bool obsecureText = false;
  String? selectedSpecialization;
  String? selectedGovernorate;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'إنشاء حساب جديد',
                    style: Styles.textStyle28SemiBold.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                TextFieldsSection(
                  nameController: nameController,
                  emailController: emailController,
                  phoneController: phoneController,
                  passwordController: passwordController,
                  obsecureText: obsecureText,
                  showorHidePass: ShowOrHidePass(
                    onToggle: () {
                      setState(() {
                        obsecureText = !obsecureText;
                      });
                    },
                    obsecureText: obsecureText,
                  ),
                ),
                GovernorateDropdown(
                  selectedGovernorate: selectedGovernorate,
                  onChanged: (String? value) {
                    setState(() {
                      selectedGovernorate = value;
                    });
                  },
                ),
                selectedRole == 'دكتور'
                    ? SpecializationsDropdown(
                        selectedSpecialization: selectedSpecialization,
                        onChanged: (String? value) {
                          setState(() {
                            selectedSpecialization = value;
                          });
                        },
                      )
                    : const SizedBox.shrink(),
                SizedBox(height: 20.h),
                Center(
                  child: CustomButton(
                    text: 'إنشاء حساب',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (selectedGovernorate == null ||
                            selectedGovernorate!.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('من فضلك اختر المحافظة'),
                              backgroundColor: Colors.redAccent,
                              behavior: SnackBarBehavior.floating,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                          return;
                        }

                        print('✅ Name: ${nameController.text}');
                        print('✅ Email: ${emailController.text}');
                        print('✅ Password: ${passwordController.text}');
                        print('✅ Governorate: $selectedGovernorate');
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
