import 'package:doktory/features/doctor/all_appointments/presentation/widgets/action_button.dart';
import 'package:doktory/features/shared/appointment/data/models/appointment_model.dart';
import 'package:doktory/features/user/user_appointments/presentation/cubits/appointment_status/appointment_status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDoctorButtons extends StatelessWidget {
  const CustomDoctorButtons({super.key, required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentStatusCubit, AppointmentStatusState>(
      listener: (context, state) {
        if (state is AppointmentStatusSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('تم تحديث الحالة إلى ${state.newStatus} بنجاح'),
            ),
          );
        } else if (state is AppointmentStatusFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('حدث خطأ: ${state.message}')));
        }
      },
      builder: (context, state) {
        final cubit = context.read<AppointmentStatusCubit>();

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ActionButton(
              text: state is AppointmentStatusLoading
                  ? 'جارٍ الحفظ...'
                  : 'قبول',
              onTap: state is AppointmentStatusLoading
                  ? null
                  : () {
                      cubit.updateStatus(appointment.id, 'مقبول');
                    },
            ),
            SizedBox(width: 30.w),
            ActionButton(
              text: 'رفض',
              isFilled: false,
              onTap: state is AppointmentStatusLoading
                  ? null
                  : () async {
                      final reason = await _showRejectionDialog(context);
                      if (reason != null && reason.isNotEmpty) {
                        cubit.updateStatus(
                          appointment.id,
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
      builder: (context) => AlertDialog(
        title: const Text('سبب الرفض'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'اكتب سبب الرفض هنا...'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text.trim()),
            child: const Text('تأكيد'),
          ),
        ],
      ),
    );
  }
}
