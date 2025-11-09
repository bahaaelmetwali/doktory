import 'package:doktory/features/user/doctor_list_screen/presentation/views/home_screen.dart';
import 'package:doktory/features/user/user_appointments_screen.dart';
import 'package:doktory/features/user/user_chat_screen.dart';
import 'package:doktory/features/user/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:doktory/core/constants.dart';

class UserNavigation extends StatefulWidget {
  const UserNavigation({super.key});

  @override
  State<UserNavigation> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserNavigation> {
  final List<Widget> screens = [
    HomeUserScreen(),
    UserAppointmentsScreen(),
    UserProfileScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),

          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital_outlined),
                label: 'الأطباء',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month_outlined),
                label: 'حجوزاتي',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'صفحتي',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
