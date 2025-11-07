import 'package:doktory/core/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

class DoctorsListScreenBody extends StatelessWidget {
  const DoctorsListScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [HomeAppBar()]);
  }
}
