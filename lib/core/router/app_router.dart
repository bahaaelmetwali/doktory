import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/features/doctor/doctor_navigation.dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/shared/auth/presentation/views/add_location_screen.dart';
import 'package:doktory/features/shared/auth/presentation/views/complete_data_screen.dart';
import 'package:doktory/features/shared/auth/presentation/views/log_in_screen.dart';
import 'package:doktory/features/shared/auth/presentation/views/sign_up_screen.dart';
import 'package:doktory/features/shared/auth/presentation/views/select_role_screen.dart';
import 'package:doktory/features/shared/more/presentation/views/privacy_policy_screen.dart';
import 'package:doktory/features/shared/more/presentation/views/show_user_profile_screen.dart';
import 'package:doktory/features/shared/more/presentation/views/terms_and_conditions_screen.dart';
import 'package:doktory/features/shared/splash/presentation/views/splash_screen.dart';
import 'package:doktory/features/shared/appointment/data/models/appointment_model.dart';
import 'package:doktory/features/user/user_appointments/presentation/views/appointment_details_screen.dart';
import 'package:doktory/features/user/doctor_details/presentation/views/doctor_details_screen.dart';
import 'package:doktory/features/user/home/presentation/views/all_doctors_screen.dart';
import 'package:doktory/features/user/home/presentation/views/category_doctors_screen.dart';
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
      // userScreens
      GoRoute(
        path: AppRouterNames.homeUserScreen,
        builder: (context, state) => const UserNavigation(currentIndex: 0),
      ),
      GoRoute(
        path: AppRouterNames.userAppointmentsScreen,
        builder: (context, state) => const UserNavigation(currentIndex: 1),
      ),
      GoRoute(
        path: AppRouterNames.moreProfile,
        builder: (context, state) => const UserNavigation(currentIndex: 2),
      ),
      GoRoute(
        path: AppRouterNames.allDoctorsScreen,
        builder: (context, state) => const AllDoctorsScreen(),
      ),
      GoRoute(
        path: AppRouterNames.categoryDoctors,
        builder: (context, state) {
          final specialization = state.extra as String;
          return CategoryDoctorsScreen(specialization: specialization);
        },
      ),
      GoRoute(
        path: AppRouterNames.doctorDetailsScreen,
        builder: (context, state) {
          final UserModel doctor = state.extra as UserModel;
          return DoctorDetailsScreen(doctor: doctor);
        },
      ),
      GoRoute(
        path: AppRouterNames.appointmentDetailsView,
        builder: (context, state) {
          final AppointmentModel appointment = state.extra as AppointmentModel;
          return AppointmentDetailsScreen(appointment: appointment);
        },
      ),
      //doctorScreens
      GoRoute(
        path: AppRouterNames.allAppointmentsScreen,
        builder: (context, state) => const DoctorNavigation(currentIndex: 0),
      ),
      GoRoute(
        path: AppRouterNames.scheduleScreen,
        builder: (context, state) => const DoctorNavigation(currentIndex: 1),
      ),
      //more
      GoRoute(
        path: AppRouterNames.termsAndConditionsScreen,
        builder: (BuildContext context, GoRouterState state) {
          return TermsAndConditionsScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.privacyPolicyScreen,
        builder: (BuildContext context, GoRouterState state) {
          return PrivacyPolicyScreen();
        },
      ),
      GoRoute(
        path: AppRouterNames.showUserProfileScreen,
        builder: (BuildContext context, GoRouterState state) {
          return ShowUserProfileScreen();
        },
      ),
    ],
  );
}
