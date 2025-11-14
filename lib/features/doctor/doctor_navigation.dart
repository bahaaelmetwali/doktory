import 'package:doktory/features/doctor/all_appointments/presentation/views/all_appointments_screen.dart';
import 'package:doktory/features/doctor/all_appointments/presentation/views/schedule_screen.dart';
import 'package:doktory/features/shared/more/presentation/views/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:doktory/core/constants.dart';

class DoctorNavigation extends StatefulWidget {
  const DoctorNavigation({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  State<DoctorNavigation> createState() => _DoctorNavigationState();
}

class _DoctorNavigationState extends State<DoctorNavigation> {
  late int currentIndex;

  final List<Widget> screens = [
    AllAppointmentsScreen(),
    ScheduleScreen(),
    MoreScreen(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

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
                icon: Icon(Icons.calendar_today_outlined),
                label: 'الحجوزات',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.schedule_outlined),
                label: 'جدول العمل',
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
