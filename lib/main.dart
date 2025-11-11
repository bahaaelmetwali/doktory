import 'package:doktory/core/router/app_router.dart';
import 'package:doktory/core/utils/my_bloc_observer.dart';
import 'package:doktory/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  await initializeDateFormatting('ar');

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
