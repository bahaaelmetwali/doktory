import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:doktory/core/constants.dart';
import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/features/shared/auth/presentation/cubits/auth_check/auth_check_cubit.dart';
import 'package:doktory/features/shared/splash/widgets/logo_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthCheckCubit _authCubit;

  @override
  void initState() {
    super.initState();
    _authCubit = getIt<AuthCheckCubit>();

    Future.delayed(const Duration(seconds: 6), () {
      _authCubit.checkAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCheckCubit>.value(
      value: _authCubit,
      child: BlocListener<AuthCheckCubit, AuthCheckState>(
        listener: (context, state) {
          if (state is AuthCheckAuthenticated) {
            final currentUser = state.user;
            final userRole = currentUser.role;
            if (userRole == 'عميل') {
              context.go(AppRouterNames.userHomeScreen);
            } else if (userRole == 'دكتور') {
              // context.go(AppRouterNames.doctorHomeScreen);
            }
          } else if (state is AuthCheckNeedsCompletion) {
            context.go(AppRouterNames.selectRoleScreen);
          } else if (state is AuthCheckUnauthenticated) {
            context.go(AppRouterNames.signUpScreen);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.scaffold,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LogoSplash(),
                const SizedBox(height: 24),
                DefaultTextStyle(
                  style: Styles.textStyle28Bold.copyWith(
                    color: AppColors.primary,
                  ),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'دكتوري',
                        speed: const Duration(milliseconds: 550),
                        cursor: '',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
