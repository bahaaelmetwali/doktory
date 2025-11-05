import 'package:doktory/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShownMapSection extends StatefulWidget {
  const ShownMapSection({super.key, required this.selectedLocation});

  final LatLng? selectedLocation;

  @override
  State<ShownMapSection> createState() => _ShownMapSectionState();
}

class _ShownMapSectionState extends State<ShownMapSection> {
  GoogleMapController? _mapController;
  @override
  void didUpdateWidget(covariant ShownMapSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedLocation != oldWidget.selectedLocation &&
        widget.selectedLocation != null) {
      _mapController?.animateCamera(
        CameraUpdate.newLatLng(widget.selectedLocation!),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      margin: EdgeInsets.only(top: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),

        child: GoogleMap(
          onMapCreated: (controller) {
            _mapController = controller;
          },
          initialCameraPosition: CameraPosition(
            target: widget.selectedLocation!,
            zoom: 14,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('position'),
              position: widget.selectedLocation!,
            ),
          },
          zoomControlsEnabled: false,
          scrollGesturesEnabled: false,
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,
          myLocationButtonEnabled: false,
          mapToolbarEnabled: false,
        ),
      ),
    );
  }
}
