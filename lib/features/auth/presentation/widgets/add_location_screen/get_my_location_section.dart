import 'package:doktory/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            CustomButton(onPressed: onPressed, text: 'تفقد موقعي'),
          ],
        ),
      ),
    );
  }
}
