import 'package:doktory/core/constants.dart';
import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_button.dart';
import 'package:doktory/core/widgets/custom_navigation_button.dart';
import 'package:doktory/core/widgets/show_or_hide_pass.dart';
import 'package:doktory/features/auth/data/models/auth_request_model.dart';
import 'package:doktory/features/auth/presentation/cubits/cubit/register_cubit.dart';
import 'package:doktory/features/auth/presentation/widgets/register_process.dart';
import 'package:doktory/features/auth/presentation/widgets/text_fields_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LogInScreenBody extends StatefulWidget {
  const LogInScreenBody({super.key});

  @override
  State<LogInScreenBody> createState() => _LogInScreenBodyState();
}

class _LogInScreenBodyState extends State<LogInScreenBody> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obsecureText = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AbsorbPointer(
        absorbing: false,
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
                      'تسجيل الدخول',
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
                  CustomButton(
                    text: 'تسجيل الدخول',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final AuthRequestModel model = AuthRequestModel(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                        context.read<RegisterCubit>().registerUser(model);
                      }
                    },
                  ),
                  CustomNavigationButton(
                    solidText: 'ليس لديك  حساب ؟',
                    navigationText: 'تسجيل حساب',

                    onPressed: () {
                      context.go(AppRouterNames.signUpScreen);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
