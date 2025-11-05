import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSection extends StatelessWidget {
  const MapSection({
    super.key,
    required this.mapController,
    required this.onMapCreated,
    required this.onTap,
    required this.selectedLocation,
  });
  final GoogleMapController? mapController;
  final void Function(GoogleMapController)? onMapCreated;
  final void Function(LatLng)? onTap;
  final LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(30.033333, 31.233334),
        zoom: 15,
      ),
      onMapCreated: onMapCreated,
      onTap: onTap,
      markers: selectedLocation != null
          ? {
              Marker(
                markerId: const MarkerId('Selectedposition'),
                position: selectedLocation!,
              ),
            }
          : {},
    );
  }
}
