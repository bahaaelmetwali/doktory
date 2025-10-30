import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/utils/validator.dart';
import 'package:doktory/core/widgets/custom_button.dart';
import 'package:doktory/core/widgets/custom_text_form_field.dart';
import 'package:doktory/features/auth/presentation/widgets/governorate_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

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

                CustomTextFormField(
                  controller: nameController,

                  hintText: 'الاسم الكامل',
                  name: 'الاسم الكامل',

                  iconPath: 'assets/icons/profile.svg',
                  validator: Validator.nameValidator,
                ),

                CustomTextFormField(
                  controller: emailController,
                  hintText: 'البريد الإلكتروني',
                  name: 'البريد الإلكتروني',

                  iconPath: 'assets/icons/sms.svg',
                  validator: Validator.emailValidator,
                ),
                CustomTextFormField(
                  controller: phoneController,
                  hintText: 'رقم الهاتف',
                  name: 'رقم الهاتف',

                  iconPath: 'assets/icons/phone.svg',
                  obscureText: false,
                  validator: Validator.passwordValidator,
                ),

                CustomTextFormField(
                  controller: passwordController,
                  hintText: 'كلمة المرور',
                  name: 'كلمة المرور',

                  iconPath: 'assets/icons/lock.svg',
                  obscureText: true,
                  validator: Validator.passwordValidator,
                ),
                GovernorateDropdown(
                  selectedGovernorate: selectedGovernorate,
                  onChanged: (String? value) {
                    setState(() {
                      selectedGovernorate = value;
                    });
                  },
                ),
                SizedBox(height: 20.h),

                Builder(
                  builder: (context) {
                    return Center(
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
