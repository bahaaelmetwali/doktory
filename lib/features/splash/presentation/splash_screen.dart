import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/features/splash/widgets/logo_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoSplash(),
            SizedBox(
              child: DefaultTextStyle(
                style: Styles.textStyle28Bold.copyWith(
                  color: AppColors.primary,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
            
                    TypewriterAnimatedText(
                      'دكتوري',
                      speed: Duration(milliseconds: 600),
                      cursor: '',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
