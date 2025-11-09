import 'package:doktory/features/user/home/presentation/widgets/list_of_doctors_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:doktory/core/widgets/custom_app_bar.dart';
import 'package:doktory/core/widgets/custom_text_form_field.dart';
import 'package:doktory/features/user/home/presentation/cubits/all_doctors/all_doctors_cubit.dart';
import 'package:doktory/core/utils/service_locator.dart';

class CategoryDoctorsScreen extends StatefulWidget {
  final String specialization;
  const CategoryDoctorsScreen({super.key, required this.specialization});

  @override
  State<CategoryDoctorsScreen> createState() => _CategoryDoctorsScreenState();
}

class _CategoryDoctorsScreenState extends State<CategoryDoctorsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AllDoctorsCubit>()..getDoctors(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).padding.top,
                color: Colors.white,
              ),
              CustomAppBar(
                onTap: () => Navigator.pop(context),
                headingText: widget.specialization,
              ),

              Container(
                color: Colors.white,
                child: Center(
                  child: CustomTextFormField(
                    name: '',
                    hintText: 'أدخل اسم الدكتور',
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                      });
                    },
                  ),
                ),
              ),

              ListOfDoctorsSection(
                specialization: widget.specialization,
                searchText: _searchText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
