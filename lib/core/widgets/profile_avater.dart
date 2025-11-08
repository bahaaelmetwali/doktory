import 'package:cached_network_image/cached_network_image.dart';
import 'package:doktory/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileAvatar extends StatelessWidget {
  final String? imageUrl;
  const ProfileAvatar({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;

    return CircleAvatar(
      radius: 25.r,
      backgroundColor: Colors.grey[200],
      child: ClipOval(
        child: hasImage
            ? CachedNetworkImage(
                imageUrl: imageUrl!,
                fit: BoxFit.cover,
                width: 50.w,
                height: 50.h,
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    width: 20.r,
                    height: 20.r,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.person, size: 30.r, color: Colors.grey),
                fadeInDuration: const Duration(milliseconds: 300),
                fadeOutDuration: const Duration(milliseconds: 300),
              )
            : Icon(Icons.person, size: 30.r, color: Colors.grey),
      ),
    );
  }
}
