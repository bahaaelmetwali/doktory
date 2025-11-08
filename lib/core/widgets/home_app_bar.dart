import 'package:doktory/core/constants.dart';
import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/profile_avater.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/auth_check/auth_check_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCheckCubit, AuthCheckState>(
      listener: (context, state) {
        if (state is AuthCheckUnauthenticated) {
          context.go(AppRouterNames.logInScreen);
        }
      },
      child: BlocBuilder<AuthCheckCubit, AuthCheckState>(
        builder: (context, state) {
          String userName = 'مرحبا بك !';
          String? userImage;

          if (state is AuthCheckAuthenticated) {
            userName = state.user.name ?? 'مرحبا بك !';
            userImage = state.user.image;
            print('User image URL: $userImage');
          }

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
                    child: ProfileAvatar(imageUrl: userImage),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('مرحبا بك !', style: Styles.textStyle14SemiBold),
                      Text(userName, style: Styles.textStyle14SemiBold),
                    ],
                  ),
                  Spacer(),
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
        },
      ),
    );
  }
}
