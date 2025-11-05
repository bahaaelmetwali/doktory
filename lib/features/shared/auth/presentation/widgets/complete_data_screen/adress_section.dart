import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdressSection extends StatelessWidget {
  const AdressSection({super.key, required this.adress});

  final String? adress;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            adress ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle16Medium.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              height: 1.4,
              color: const Color(0xFF1D1B20),
            ),
          ),
        ),
      ],
    );
  }
}
