import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  final String? base64Image;
  const ProfileAvatar({super.key, this.base64Image});

  @override
  Widget build(BuildContext context) {
    final hasImage = base64Image != null && base64Image!.isNotEmpty;

    return CircleAvatar(
      radius: 25.r,
      backgroundColor: Colors.grey[200],
      child: ClipOval(
        child: hasImage
            ? Image.memory(
                base64Decode(base64Image!),
                fit: BoxFit.cover,
                width: 50.w,
                height: 50.h,
              )
            : Icon(Icons.person, size: 30.r, color: Colors.grey),
      ),
    );
  }
}
