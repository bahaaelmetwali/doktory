import 'package:doktory/features/user/doctor_list_screen/presentation/views/doctors_list_screen.dart';
import 'package:doktory/features/user/user_appointments_screen.dart';
import 'package:doktory/features/user/user_chat_screen.dart';
import 'package:doktory/features/user/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:doktory/core/constants.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final List<Widget> screens = [
    DoctorsListScreen(),
    UserAppointmentsScreen(),
    UserChatScreen(),
    UserProfileScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.chat_outlined),
            label: 'الشات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'صفحتي',
          ),
        ],
      ),
    );
  }
}
