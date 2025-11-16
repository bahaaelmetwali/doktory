import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_text_form_field.dart';
import 'package:doktory/core/widgets/show_custom_snack_bar.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/all_appointments/action_button.dart';
import 'package:doktory/features/shared/appointment/data/models/appointment_model.dart';
import 'package:doktory/features/user/user_appointments/presentation/cubits/appointment_status/appointment_status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDoctorButtons extends StatefulWidget {
  const CustomDoctorButtons({super.key, required this.appointment});
  final AppointmentModel appointment;

  @override
  State<CustomDoctorButtons> createState() => _CustomDoctorButtonsState();
}

class _CustomDoctorButtonsState extends State<CustomDoctorButtons> {
  bool isAcceptLoading = false;
  bool isRejectLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentStatusCubit, AppointmentStatusState>(
      listener: (context, state) {
        if (state is AppointmentStatusSuccess) {
          setState(() {
            isAcceptLoading = false;
            isRejectLoading = false;
          });
          showCustomSnackBar(context, message: 'تم تحديث الحالة بنجاح');
        } else if (state is AppointmentStatusFailure) {
          setState(() {
            isAcceptLoading = false;
            isRejectLoading = false;
          });
          showCustomSnackBar(
            context,
            message: 'حدث خطأ: ${state.message}',
            isError: true,
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<AppointmentStatusCubit>();

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ActionButton(
              text: 'قبول',
              isLoading: isAcceptLoading,
              onTap: () async {
                setState(() {
                  isAcceptLoading = true;
                });
                await cubit.updateStatus(widget.appointment.id, 'مقبول');
              },
            ),
            SizedBox(width: 30.w),
            ActionButton(
              text: 'رفض',
              isFilled: false,
              isLoading: isRejectLoading,
              onTap: () async {
                final reason = await _showRejectionDialog(context);
                if (reason != null && reason.isNotEmpty) {
                  setState(() {
                    isRejectLoading = true;
                  });
                  await cubit.updateStatus(
                    widget.appointment.id,
                    'مرفوض',
                    rejectionReason: reason,
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<String?> _showRejectionDialog(BuildContext context) async {
    final TextEditingController controller = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (context) => Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          backgroundColor: AppColors.scaffold,
          title: Center(
            child: Text(' الرفض', style: Styles.textStyle18SemiBold),
          ),
          content: SizedBox(
            width: double.maxFinite,
            height: 100.h,
            child: CustomTextFormField(
              controller: controller,
              name: 'سبب الرفض',
              hintText: 'ادخل سبب الرفض',
            ),
          ),
          actions: [
            ActionButton(
              text: "الغاء",
              isFilled: false,
              onTap: () => Navigator.pop(context),
            ),
            ActionButton(
              onTap: () => Navigator.pop(context, controller.text.trim()),
              text: 'تأكيد',
            ),
          ],
        ),
      ),
    );
  }
}
