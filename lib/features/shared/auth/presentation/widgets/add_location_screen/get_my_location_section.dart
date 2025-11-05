import 'package:doktory/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetMyLocationSection extends StatelessWidget {
  const GetMyLocationSection({super.key, required this.onPressed});

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: CustomButton(onPressed: onPressed, text: 'تفقد موقعي'),
        ),
      ),
    );
  }
}
