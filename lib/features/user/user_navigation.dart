import 'package:doktory/features/user/home/presentation/views/home_screen.dart';
import 'package:doktory/features/user/doctor_details/presentation/views/user_appointments_screen.dart';
import 'package:doktory/features/user/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:doktory/core/constants.dart';

class UserNavigation extends StatefulWidget {
  const UserNavigation({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  State<UserNavigation> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserNavigation> {
  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  final List<Widget> screens = [
    HomeUserScreen(),
    UserAppointmentsScreen(),
    UserProfileScreen(),
  ];
  late int currentIndex;

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
