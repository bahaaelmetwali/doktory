
import 'package:doktory/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LogoSplash extends StatefulWidget {
  const LogoSplash({super.key});

  @override
  State<LogoSplash> createState() => _LogoSplashState();
}

class _LogoSplashState extends State<LogoSplash>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppColors.lottieSplash,
      width: 400.w,
      height: 400.h,
      fit: BoxFit.contain,
      controller: _controller,
      onLoaded: (composition) {
        _controller.duration = composition.duration * 2;
        _controller.forward();
      },
    );
  }
}
