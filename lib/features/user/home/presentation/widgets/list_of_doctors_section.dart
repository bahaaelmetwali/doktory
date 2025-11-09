import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/doctor_pagination_helper%20dart';
import 'package:doktory/features/shared/auth/data/models/user_model.dart';
import 'package:doktory/features/user/home/presentation/cubits/all_doctors/all_doctors_cubit.dart';
import 'package:doktory/features/user/home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOfDoctorsSection extends StatefulWidget {
  const ListOfDoctorsSection({
    super.key,
    this.specialization,
    required this.searchText,
  });

  final String? specialization;
  final String searchText;

  @override
  State<ListOfDoctorsSection> createState() => _ListOfDoctorsSectionState();
}

class _ListOfDoctorsSectionState extends State<ListOfDoctorsSection> {
  final ScrollController _scrollController = ScrollController();
  final List<UserModel> _displayedDoctors = [];
  late DoctorPaginationHelper _paginationHelper;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 50 &&
          _paginationHelper.hasMore()) {
        _loadNextPage();
      }
    });
  }

  void _loadNextPage() {
    final nextDoctors = _paginationHelper.getNextPage();
    if (nextDoctors.isNotEmpty) {
      setState(() {
        _displayedDoctors.addAll(nextDoctors);
      });
    }
  }

  @override
  void didUpdateWidget(covariant ListOfDoctorsSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchText != widget.searchText ||
        oldWidget.specialization != widget.specialization) {
      _displayedDoctors.clear();
      _paginationHelper.reset();
      final state = context.read<AllDoctorsCubit>().state;
      if (state is AllDoctorsLoaded) {
        _paginationHelper = DoctorPaginationHelper(
          allDoctors: state.doctors,
          specialization: widget.specialization,
          searchText: widget.searchText,
        );
        WidgetsBinding.instance.addPostFrameCallback((_) => _loadNextPage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<AllDoctorsCubit, AllDoctorsState>(
        builder: (context, state) {
          if (state is AllDoctorsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          } else if (state is AllDoctorsError) {
            return Center(child: Text(state.message));
          } else if (state is AllDoctorsLoaded) {
            _paginationHelper = DoctorPaginationHelper(
              allDoctors: state.doctors,
              specialization: widget.specialization,
              searchText: widget.searchText,
            );

            if (_displayedDoctors.isEmpty) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) => _loadNextPage(),
              );
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }

            if (_displayedDoctors.isEmpty) {
              return Center(
                child: Text(
                  'لا يوجد أطباء مطابقين للبحث',
                  style: Styles.textStyle16Medium,
                ),
              );
            }

            return ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(8.r),
              itemCount:
                  _displayedDoctors.length +
                  (_paginationHelper.hasMore() ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == _displayedDoctors.length) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(child: CircularProgressIndicator()),
                  );
                }
                return DoctorCard(doctor: _displayedDoctors[index]);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
