import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_button.dart';
import 'package:doktory/core/widgets/show_or_hide_pass.dart';
import 'package:doktory/features/auth/presentation/widgets/text_fields_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final _formKey = GlobalKey<FormState>();
  String? selectedRole;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obsecureText = false;
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Constants.mainLogo, height: 120.h, width: 120.w),
                SizedBox(height: 10.h),
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
                  emailController: emailController,
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

                SizedBox(height: 20.h),
                Center(
                  child: CustomButton(
                    text: 'إنشاء حساب',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print('✅ Email: ${emailController.text}');
                        print('✅ Password: ${passwordController.text}');
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
