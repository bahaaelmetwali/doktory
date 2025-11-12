import 'package:doktory/core/widgets/home_app_bar.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/widgets/submitted_offers_section.dart';
import 'package:flutter/material.dart';

class AllAppointmentsScreenBody extends StatelessWidget {
  const AllAppointmentsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBar(),
        Expanded(child: SubmittedOffersSection()),
      ],
    );
  }
}
