import 'package:doktory/features/user/doctor_details/presentation/widgets/user_appointment_card.dart';
import 'package:flutter/material.dart';

class UserAppointmentsListView extends StatelessWidget {
  const UserAppointmentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return UserAppointmentCard();
      },
    );
  }
}
