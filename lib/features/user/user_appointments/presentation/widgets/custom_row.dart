import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.title,
    required this.information,
    this.infoColor,
  });

  final String title;
  final String information;
  final Color? infoColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.textStyle14SemiBold.copyWith(color: Colors.grey),
        ),
        const Spacer(),
        Text(
          information,
          style: Styles.textStyle14SemiBold.copyWith(
            fontWeight: FontWeight.w500,
            color: infoColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
