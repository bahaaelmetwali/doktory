import 'package:doktory/core/constants.dart';
import 'package:doktory/core/location/cubit/location_cubit_cubit.dart';
import 'package:doktory/core/location/cubit/location_cubit_state.dart';
import 'package:doktory/core/utils/styles.dart';
import 'package:doktory/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EnterLocationSection extends StatelessWidget {
  const EnterLocationSection({super.key, required this.selectedLocation});
  final LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                if (state is LocationLoading) {
                  return Padding(
                    padding: EdgeInsets.all(12),
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                } else if (state is LocationLoaded) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 8.h,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location.svg',
                          width: 24.w,
                          height: 24.h,
                          color: AppColors.primary,
                        ),
                        SizedBox(width: 6.w),
                        Expanded(
                          child: Text(
                            state.location.displayName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Styles.textStyle12SemiBold.copyWith(
                              color: const Color(0xFF1D1B20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is LocationError) {
                  return Padding(
                    padding: EdgeInsets.all(12.r),
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            CustomButton(
              onPressed: () {
                if (selectedLocation != null) {
                  final state = context.read<LocationCubit>().state;
                  String? address;

                  if (state is LocationLoaded) {
                    address = state.location.displayName;
                  }

                  context.pop({
                    'latitude': selectedLocation!.latitude,
                    'longitude': selectedLocation!.longitude,
                    'address': address,
                  });
                }
              },

              text: 'أضف الموقع',
            ),
          ],
        ),
      ),
    );
  }
}
