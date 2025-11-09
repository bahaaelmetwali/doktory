import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/features/shared/auth/presentation/views/add_location_screen.dart';
import 'package:doktory/features/shared/auth/presentation/views/complete_data_screen.dart';
import 'package:doktory/features/shared/auth/presentation/views/log_in_screen.dart';
import 'package:doktory/features/shared/auth/presentation/views/sign_up_screen.dart';
import 'package:doktory/features/shared/auth/presentation/views/select_role_screen.dart';
import 'package:doktory/features/shared/splash/presentation/views/splash_screen.dart';
import 'package:doktory/features/user/doctor_list_screen/presentation/views/home_screen.dart';
import 'package:doktory/features/user/user_navigation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> routerKey = GlobalKey<NavigatorState>();

abstract class AppRouter {
  static final GoRouter router = GoRouter(
    navigatorKey: routerKey,
    initialLocation: AppRouterNames.splashScreen,

    routes: <RouteBase>[
      GoRoute(
        path: AppRouterNames.splashScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.selectRoleScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SelectRoleScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.signUpScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.logInScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const LogInScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.completeDataScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const CompleteDataScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.addLocationScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const AddLocationScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.userNavigation,
        builder: (context, state) => const UserNavigation(),
      ),

      GoRoute(
        path: AppRouterNames.homeUserScreen,
        builder: (context, state) => const HomeUserScreen(),
      ),
    ],
  );
}
