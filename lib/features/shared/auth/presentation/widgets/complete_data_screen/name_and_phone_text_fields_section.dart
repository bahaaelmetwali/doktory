import 'package:doktory/core/utils/validator.dart';
import 'package:doktory/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class NameandPhoneTextFieldsSection extends StatelessWidget {
  const NameandPhoneTextFieldsSection({
    super.key,
    required this.nameController,
    required this.phoneController,
  });

  final TextEditingController nameController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
          validator: Validator.phoneValidator,
        ),
      ],
    );
  }
}
