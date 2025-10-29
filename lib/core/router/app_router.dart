import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/features/splash/presentation/home_screen.dart';
import 'package:doktory/features/splash/presentation/splash_screen.dart';
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
      ),  GoRoute(
        path: AppRouterNames.homeScreen,
        builder: (BuildContext context, GoRouterState state) {

          return const HomeScreen();
        },
      )]);}