import 'package:doktory/core/utils/validator.dart';
import 'package:doktory/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class TextFieldsSection extends StatelessWidget {
  const TextFieldsSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.obsecureText,

    required this.showorHidePass,
  });
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final bool obsecureText;
  final Widget showorHidePass;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          validator: Validator.passwordValidator,
          obscureText: obsecureText,

          suffixIcon: showorHidePass,
        ),
      ],
    );
  }
}
