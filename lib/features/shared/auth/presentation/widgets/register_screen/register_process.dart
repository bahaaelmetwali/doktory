import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/core/widgets/custom_button.dart';
import 'package:doktory/core/widgets/custom_loading_indicator.dart';
import 'package:doktory/core/widgets/show_custom_snack_bar.dart';
import 'package:doktory/features/shared/auth/data/models/auth_request_model.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterProcess extends StatelessWidget {
  const RegisterProcess({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showCustomSnackBar(context, message: 'تم إنشاء حساب بنجاح');
          context.go(AppRouterNames.selectRoleScreen);
        } else if (state is RegisterFailure) {
          showCustomSnackBar(context, message: state.message, isError: true);
        }
      },
      builder: (context, state) {
        if (state is RegisterLoading) {
          return CustomLoadingIndicator();
        } else {
          return Center(
            child: CustomButton(
              text: 'إنشاء حساب',
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
          );
        }
      },
    );
  }
}
