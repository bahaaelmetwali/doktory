import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({
    super.key,
    this.leadingWidget,
    this.userName,
    this.userImage,
  });
  final Widget? leadingWidget;
  final String? userName;
  final String? userImage;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          bottom: 12.h,
          top: 12.h,
        ),

        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 6.w),
              child: CircleAvatar(
                radius: 25.r,
                backgroundColor: Colors.grey[200],
                backgroundImage: const AssetImage('assets/logos/doctor.png'),
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              children: [
                Text('مرحبا بك !', style: Styles.textStyle14SemiBold),
                Text('بهاء', style: Styles.textStyle14SemiBold),
              ],
            ),
            Spacer(),
            widget.leadingWidget ??
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.grey[200],
                  child: SvgPicture.asset(
                    'assets/icons/notification.svg',
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
