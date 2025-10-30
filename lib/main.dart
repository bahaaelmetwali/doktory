import 'package:doktory/core/router/app_router.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:doktory/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const Doktory());
}

class Doktory extends StatelessWidget {
  const Doktory({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: AppRouter.router,

        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
