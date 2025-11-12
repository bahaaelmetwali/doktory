import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/core/widgets/custom_button.dart';
import 'package:doktory/core/widgets/custom_loading_indicator.dart';
import 'package:doktory/core/widgets/show_custom_snack_bar.dart';
import 'package:doktory/features/shared/auth/data/models/auth_request_model.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/log_in_cubit/log_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogInProcess extends StatelessWidget {
  const LogInProcess({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) async {
        if (state is LogInSuccess) {
          final role = state.user.role;

          if (role == null || role.isEmpty) {
            context.go(AppRouterNames.selectRoleScreen);
            return;
          }

          if (role == 'دكتور') {
            context.go(AppRouterNames.allAppointmentsScreen);
          } else {
            context.go(AppRouterNames.homeUserScreen);
          }

          showCustomSnackBar(context, message: 'تم تسجيل الدخول');
        } else if (state is LogInFailure) {
          showCustomSnackBar(context, message: state.message, isError: true);
        }
      },
      builder: (context, state) {
        if (state is LogInLoading) {
          return CustomLoadingIndicator();
        } else {
          return Center(
            child: CustomButton(
              text: 'تسجيل الدخول',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  final AuthRequestModel model = AuthRequestModel(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  context.read<LogInCubit>().loginUser(model);
                }
              },
            ),
          );
        }
      },
    );
  }
}
