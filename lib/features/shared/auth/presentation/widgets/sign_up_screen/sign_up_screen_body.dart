import 'package:doktory/core/constants.dart';
import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_navigation_button.dart';
import 'package:doktory/core/widgets/show_or_hide_pass.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/register_screen/register_process.dart';
import 'package:doktory/features/shared/auth/presentation/widgets/text_fields_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpScreenBody extends StatefulWidget {
  const SignUpScreenBody({super.key});

  @override
  State<SignUpScreenBody> createState() => _SignUpScreenBodyState();
}

class _SignUpScreenBodyState extends State<SignUpScreenBody> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obsecureText = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final isLoading = state is RegisterLoading;

        return Directionality(
          textDirection: TextDirection.rtl,
          child: AbsorbPointer(
            absorbing: isLoading,
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        Constants.mainLogo,
                        height: 120.h,
                        width: 120.w,
                      ),
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
                      RegisterProcess(
                        formKey: _formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
                      CustomNavigationButton(
                        solidText: 'لديك حساب ؟',
                        navigationText: 'تسجيل الدخول',
                        onPressed: () {
                          context.go(AppRouterNames.logInScreen);
                        },
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
