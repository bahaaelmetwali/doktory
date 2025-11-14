import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/show_custom_snack_bar.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/all_appointments/action_button.dart';
import 'package:doktory/features/shared/more/domain/use_cases/log_out_use_case.dart';
import 'package:doktory/features/shared/more/presentation/cubits/log_out/logout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LogoutProcess extends StatelessWidget {
  const LogoutProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        width: 360.w,
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("تسجيل الخروج", style: Styles.textStyle16Medium),
            SizedBox(height: 12.h),
            Text(
              "هل أنت متأكد أنك تريد تسجيل الخروج؟",
              textAlign: TextAlign.center,
              style: Styles.textStyle14Regular,
            ),
            SizedBox(height: 24.h),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionButton(
                    text: "إلغاء",
                    isFilled: false,
                    isLogoutButton: true,
                    onTap: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 12.w),
                  BlocProvider(
                    create: (context) =>
                        LogoutCubit(logoutUseCase: getIt<LogoutUseCase>()),
                    child: BlocProvider(
                      create: (context) =>
                          LogoutCubit(logoutUseCase: getIt<LogoutUseCase>()),
                      child: BlocListener<LogoutCubit, LogoutState>(
                        listener: (context, state) {
                          if (state is LogoutSuccess) {
                            context.go(AppRouterNames.logInScreen);
                          } else if (state is LogoutFailure) {
                            showCustomSnackBar(context, message: state.message);
                          }
                        },
                        child: BlocBuilder<LogoutCubit, LogoutState>(
                          builder: (context, state) {
                            return ActionButton(
                              text: "تأكيد",
                              isLogoutButton: true,
                              isLoading: state is LogoutLoading,
                              onTap: () {
                                if (state is! LogoutLoading) {
                                  context.read<LogoutCubit>().logout();
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
