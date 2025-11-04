import 'package:doktory/core/constants.dart';
import 'package:doktory/core/router/app_router_names.dart';
import 'package:doktory/features/auth/presentation/widgets/complete_data_screen/adress_section.dart';
import 'package:doktory/features/auth/presentation/widgets/complete_data_screen/icon_title_with_line_section.dart';
import 'package:doktory/features/auth/presentation/widgets/complete_data_screen/shown_map_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetLocationSection extends StatefulWidget {
  const GetLocationSection({
    super.key,
    required this.selectedLocation,
    required this.adress,
    required this.onLocationChanged,
  });
  final LatLng? selectedLocation;
  final String? adress;
  final Function(LatLng newLocation, String newAddress) onLocationChanged;

  @override
  State<GetLocationSection> createState() => _GetLocationSectionState();
}

class _GetLocationSectionState extends State<GetLocationSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconTitleWithLineSection(),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 10.r, left: 8.r),
                child: GestureDetector(
                  onTap: () async {
                    final result = await context.push<Map<String, dynamic>>(
                      AppRouterNames.addLocationScreen,
                    );
                    setState(() {
                      widget.onLocationChanged(
                        LatLng(result!['latitude'], result['longitude']),
                        result['address'],
                      );
                    });
                  },
                  child: Icon(
                    widget.selectedLocation != null
                        ? Icons.edit_location_alt_rounded
                        : Icons.add_location_alt_rounded,
                    color: AppColors.success,
                    size: 30.r,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          widget.selectedLocation == null
              ? SizedBox.shrink()
              : Column(
                  children: [
                    ShownMapSection(selectedLocation: widget.selectedLocation),
                    SizedBox(height: 8.h),
                    AdressSection(adress: widget.adress),
                  ],
                ),
        ],
      ),
    );
  }
}
