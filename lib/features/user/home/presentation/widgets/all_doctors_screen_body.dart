import 'package:doktory/core/widgets/custom_app_bar.dart';
import 'package:doktory/core/widgets/custom_text_form_field.dart';
import 'package:doktory/features/user/home/presentation/widgets/list_of_doctors_section.dart';
import 'package:flutter/material.dart';

class AllDoctorsScreenBody extends StatefulWidget {
  const AllDoctorsScreenBody({super.key});

  @override
  State<AllDoctorsScreenBody> createState() => _AllDoctorsScreenBodyState();
}

class _AllDoctorsScreenBodyState extends State<AllDoctorsScreenBody> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Colors.white,
          ),
          CustomAppBar(
            onTap: () => Navigator.pop(context),
            headingText: 'كل الأطباء',
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Center(
              child: CustomTextFormField(
                name: '',
                hintText: 'ابحث عن طبيب',
                iconPath: 'assets/icons/search.svg',
                onChanged: (value) {
                  setState(() {
                    searchText = value.trim().toLowerCase();
                  });
                },
              ),
            ),
          ),

          ListOfDoctorsSection(searchText: searchText),
        ],
      ),
    );
  }
}
