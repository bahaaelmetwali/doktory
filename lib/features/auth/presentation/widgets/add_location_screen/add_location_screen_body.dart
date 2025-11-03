import 'package:doktory/core/location/cubit/location_cubit_cubit.dart';
import 'package:doktory/core/utils/geo_locator.dart';
import 'package:doktory/features/auth/presentation/widgets/add_location_screen/enter_location_section.dart';
import 'package:doktory/features/auth/presentation/widgets/add_location_screen/get_my_location_section.dart';
import 'package:doktory/features/auth/presentation/widgets/add_location_screen/map_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddLocationScreenBody extends StatefulWidget {
  const AddLocationScreenBody({super.key});

  @override
  State<AddLocationScreenBody> createState() => _AddLocationScreenBodyState();
}

class _AddLocationScreenBodyState extends State<AddLocationScreenBody> {
  GoogleMapController? _mapController;
  LatLng? _selectedLocation;

  @override
  Widget build(BuildContext context) {
    final locationCubit = context.read<LocationCubit>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox.expand(
        child: Stack(
          children: [
            MapSection(
              mapController: _mapController,
              onMapCreated: (controller) {
                _mapController = controller;
              },
              onTap: (position) {
                setState(() {
                  _selectedLocation = position;
                  locationCubit.getLocation(
                    latitude: position.latitude,
                    longitude: position.longitude,
                  );
                });
              },
              selectedLocation: _selectedLocation,
            ),
            GetMyLocationSection(
              onPressed: () async {
                final position = await SetLocation.getLocation();
                setState(() {
                  if (position != null) {
                    _selectedLocation = LatLng(
                      position.latitude,
                      position.longitude,
                    );
                    _mapController?.animateCamera(
                      CameraUpdate.newLatLngZoom(_selectedLocation!, 15),
                    );
                    locationCubit.getLocation(
                      latitude: position.latitude,
                      longitude: position.longitude,
                    );
                  }
                });
              },
            ),

            _selectedLocation != null
                ? EnterLocationSection(selectedLocation: _selectedLocation)
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
