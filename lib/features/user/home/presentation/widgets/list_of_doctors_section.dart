import 'package:doktory/core/constants.dart';
import 'package:doktory/core/utils/styles.dart';
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
  int _currentPage = 0;
  final int _pageSize = 10;
  List<UserModel> _displayedDoctors = [];
  bool _hasMore = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 50 &&
        _hasMore &&
        context.read<AllDoctorsCubit>().state is AllDoctorsLoaded) {
      _loadNextPage();
    }
  }

  List<UserModel> _filterDoctors(AllDoctorsLoaded state) {
    final allDoctors = widget.specialization == null
        ? state.doctors
        : state.doctors
              .where((doc) => doc.specialization == widget.specialization)
              .toList();

    final filtered = allDoctors
        .where(
          (doc) =>
              doc.name != null &&
              doc.name!.toLowerCase().contains(widget.searchText.toLowerCase()),
        )
        .toList();

    return filtered;
  }

  void _loadNextPage() {
    final state = context.read<AllDoctorsCubit>().state;
    if (state is AllDoctorsLoaded) {
      final filtered = _filterDoctors(state);

      final nextDoctors = filtered
          .skip(_currentPage * _pageSize)
          .take(_pageSize)
          .toList();

      if (nextDoctors.isNotEmpty) {
        setState(() {
          _displayedDoctors.addAll(nextDoctors);
          _currentPage++;
          _hasMore = _displayedDoctors.length < filtered.length;
        });
      } else {
        setState(() {
          _hasMore = false;
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant ListOfDoctorsSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchText != widget.searchText ||
        oldWidget.specialization != widget.specialization) {
      _resetPagination();
    }
  }

  void _resetPagination() {
    _displayedDoctors.clear();
    _currentPage = 0;
    _hasMore = true;
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadNextPage());
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
            if (_displayedDoctors.isEmpty && _hasMore) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                _loadNextPage();
              });
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
                  (_hasMore && _displayedDoctors.isNotEmpty ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < _displayedDoctors.length) {
                  return DoctorCard(doctor: _displayedDoctors[index]);
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  );
                }
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
